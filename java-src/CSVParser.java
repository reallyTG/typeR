
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Iterator;

/**
 * Parse multiple lines of input from a BufferedReader, each line is in comma
 * separated format.
 * 
 * @author Jan Vitek
 *
 */
public class CSVParser implements Iterable<CSVRecord> {
	BufferedReader reader;

	public CSVParser(BufferedReader reader) {
		this.reader = reader;
	}

	public Iterator<CSVRecord> iterator() {
		return new Iter();
	}

	public void close() {
		try {
			reader.close();
		} catch (IOException e) {
			throw new Error(e);
		}
	}

	class Iter implements Iterator<CSVRecord> {
		String line;

		@Override
		public boolean hasNext() {
			try {
				line = reader.readLine();
			} catch (IOException e) {
				throw new Error(e);
			}
			return line != null;
		}

		@Override
		public CSVRecord next() {
			if (line == null) return null;
			return new CSVRecord(line);
		}
	}
}
