 
import java.util.Iterator;

/**
 * Parse one line of text containing comma separated values. We support fields
 * that either sequences of character between delimiters (commas, start and end
 * of line), or between quotes. This class has several known limitations, it
 * does not support escaped quotes and has a hard bound on the number of fields.
 * Performance-wise, we could speed it up the parsing by avoiding the
 * construction by reusing instances for multiple lines. As parsing does not
 * appear to be the bottle neck, it may not be worth the effort.
 * 
 * @author Jan Vitek
 *
 */
public class CSVRecord implements Iterable<String> {
	String line;
	short fieldPos, fieldCount;
	static final short MAX_FIELDS = 125;
	short[] starts = new short[MAX_FIELDS];
	short[] ends = new short[MAX_FIELDS];

	static final char C = ',';
	static final char Q = '\"';
	static final char S = ' ';
	static final char T = '\t';

	/**
	 * The constructor does all the work of parsing out the fields.
	 * 
	 * @param line
	 *            a csv input
	 */
	public CSVRecord(String line) {
		this.line = line;
		boolean inString = false, inputSeen = false, stringClosed = false;
		short start = 0, end = 0, i;
		for (i = 0; i < line.length(); i++) {
			char c = line.charAt(i);
			if (c == Q) {
				if (!inString) {
					if (inputSeen) throw new Error("CSV Maformed, multiple elements in a field");
					inputSeen = false;
					inString = true;
					start = (short) (i + 1);
				} else { // inString
					stringClosed = true;
					inputSeen = inString = false;
					end = i;
				}
			} else if (c == C) {
				if (inString) continue;
				starts[fieldCount] = start;
				if (stringClosed || inputSeen) {
					if (!stringClosed) end = i;
					inputSeen = stringClosed = false;
				} else end = start;
				ends[fieldCount++] = end;
				start = (short) (i + 1);
			} else if (!(c == S || c == T)) {
				if (!(inString || inputSeen)) {
					if (stringClosed) throw new Error("CSV Maformed, multiple elements in a field (2)");
					else if (!inputSeen) inputSeen = true;
				}
			}
		}
		starts[fieldCount] = start;
		ends[fieldCount++] = i;
	}

	/**
	 * Return a new substring corresponding the request field in the object.
	 * 
	 * @param i
	 *            a value between 0 and fieldCount.
	 * @return a new string
	 */
	public String get(int i) {
		return line.substring(starts[i], ends[i]);
	}

	@Override
	public Iterator<String> iterator() {
		return new Iter();
	}

	/**
	 * A simple iterator.
	 * 
	 * @author Jan Vitek
	 */
	class Iter implements Iterator<String> {
		int i;

		@Override
		public boolean hasNext() {
			return i < fieldCount;
		}

		@Override
		public String next() {
			return get(i++);
		}
	}

}
