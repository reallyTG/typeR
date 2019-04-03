
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.zip.GZIPInputStream;

/**
 * Reading in a CSV file with OTP information
 *
 * @author jan
 */
public class Reader implements Iterator<Signature>, Iterable<Signature> {

	public String filename = "";
	int posInLine;
	int lineNumber;
	CSVRecord currentRecord;
	BufferedReader buffered;
	InputStream gzipStream;
	Iterator<CSVRecord> iterator;
	CSVParser parser;
	HashMap<String, Integer> badLines = new HashMap<String, Integer>();

	/**
	 * Builds a file reader.
	 *
	 * @param filename
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public Reader(String filename) throws FileNotFoundException, IOException {
		this.filename = filename;
		InputStream fileStream = new FileInputStream(filename);
		gzipStream = new GZIPInputStream(fileStream);
		java.io.Reader decoder = new InputStreamReader(gzipStream, "US-ASCII");
		buffered = new BufferedReader(decoder);
		parser = new CSVParser(buffered);
		iterator = parser.iterator();
	}

	/**
	 * Builds a string reader.
	 */
	public Reader() {
	}

	String getS() {
		String res = currentRecord.get(posInLine++);
		if (res.length() == 0 || (res.length() == 1 && res.equals(" ")))
			return "";
		else
			return res;
	}

	int getI() {
		String s = currentRecord.get(posInLine++);
		if (s.length() == 0 || s.equals(" "))
			return Integer.MIN_VALUE;
		int val = 0, i = 0;
		boolean negate = false;
		while (i < s.length() && s.charAt(i) == ' ')
			i++;
		if (negate = s.charAt(i) == '-')
			i++;
		for (; i < s.length(); i++) {
			int c = s.charAt(i) - '0';
			if (c >= 0 && c <= 9)
				val = (val * 10) + c;
			else
				break;
		}
		return negate ? -val : val;
	}

	boolean getB() {
		return getI() == 1;
	}

	public boolean hasNext() {
		try {
			return iterator.hasNext();
		} catch (Throwable e) { // This occurs when we are reading a zipped file
								// that is, eg., empty. We should simply stop
								// reading.
			throw e;
		}
	}

	public Signature next() {
		return readOne(iterator.next());
	}

	@Override
	public Iterator<Signature> iterator() {
		return this;
	}

	public void close() throws IOException {
		parser.close();
		buffered.close();
	}

	/**
	 * Reads the information contained in on comma separated value, a line of the
	 * input. The trickiest bit has been to diagnose errors in the data and in the
	 * parsing code. Support for debugging is extensive.
	 *
	 * @param rec a record
	 * @return A sane flight
	 */
	public Signature readOne(CSVRecord rec) {
		Signature f = null;
		currentRecord = rec;
		posInLine = 0;
		lineNumber++;
		try {
			f = Signature.read(this);
		} catch (Throwable e) {
			badData("Corrupt");
			System.out.println("E: " + errPos() + " " + field(rec, posInLine));
		}
		return f;
	}

	/**
	 * Merges the error information contained in two readers. This is used for
	 * reporting aggregate error counts. Updates the receiver.
	 *
	 * @param p the reader from which the information is taken.
	 */
	public void reduce(Reader p) {
		for (String e : p.badLines.keySet()) {
			int pval = p.badLines.get(e);
			int tval = 0;
			if (this.badLines.get(e) != null)
				tval = this.badLines.get(e);
			this.badLines.put(e, pval + tval);
		}
	}

	/**
	 * Increment the error counter.
	 *
	 * @param s the class of read error.
	 */
	void badData(String s) {
		Integer i = badLines.get(s);
		if (i == null)
			badLines.put(s, 1);
		else
			badLines.put(s, i + 1);
	}

	public int countErrors() {
		Integer i = 0;
		for (String s : badLines.keySet())
			i = i + badLines.get(s);
		return i;
	}

	public String getLine() {
		String res = "";
		for (String s : currentRecord)
			res += s + ",";
		res = res.substring(0, res.length() - 1);
		return res;
	}

	String errPos() {
		return filename + "(" + lineNumber + "," + posInLine + ")";
	}

	String field(CSVRecord rec, int posInLine) {
		return "f(" + posInLine + ") " + headers[posInLine] + " " + rec.get(posInLine);
	}

	static String[] headers = new String[] { "pkg", "fun", "has_dots", "arg1_t", "arg2_t", "arg3_t", "arg4_t", "arg5_t",
			"arg6_t", "arg7_t", "arg8_t", "arg9_t", "arg10_t", "arg11_t", "arg12_t", "arg13_t", "arg14_t", "arg15_t",
			"arg16_t", "arg17_t", "arg18_t", "arg19_t", "arg20_t", "arg1_c", "arg2_c", "arg3_c", "arg4_c", "arg5_c",
			"arg6_c", "arg7_c", "arg8_c", "arg9_c", "arg10_c", "arg11_c", "arg12_c", "arg13_c", "arg14_c", "arg15_c",
			"arg16_c", "arg17_c", "arg18_c", "arg19_c", "arg20_c", "arg1_a", "arg2_a", "arg3_a", "arg4_a", "arg5_a",
			"arg6_a", "arg7_a", "arg8_a", "arg9_a", "arg10_a", "arg11_a", "arg12_a", "arg13_a", "arg14_a", "arg15_a",
			"arg16_a", "arg17_a", "arg18_a", "arg19_a", "arg20_a", "ret_t", "ret_c", "ret_a" };
}
