 import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.util.zip.GZIPOutputStream;

/**
 * Write CSV files. Any IO error is considered fatal and will terminate
 * execution.
 *
 * @author jan
 */
public class Writer {

	int line;
	int offset;
	final java.io.Writer w;
	boolean DEBUG = false;
	String file = "";

	public Writer(String file) {
		try {
			this.file = file;
			w = new BufferedWriter(new OutputStreamWriter(new GZIPOutputStream(new FileOutputStream(new File(file
					+ ".gz")))));
		} catch (IOException e) {
			throw new Error(e + " in " + file);
		}
	}

	public Writer(boolean debug) {
		w = new StringWriter();
		DEBUG = debug;
	}

	public String toString() {
		return w.toString();
	}

	public void close() {
		try {
			w.flush();
			w.close();
		} catch (IOException e) {
			throw new Error(e + " in " + file);
		}
	}

	void toI(int i) {
		try {
			if (i != Integer.MIN_VALUE) w.write(Integer.toString(i));
		} catch (IOException e) {
			throw new Error(e + " in " + file);
		}
	}

	void toI(short i) {
		try {
			if (i != Short.MIN_VALUE) w.write(Short.toString(i));
		} catch (IOException e) {
			throw new Error(e + " in " + file);
		}
	}

	public void toS(String s) {
		try {
			w.write("\"" + s + "\"");
		} catch (IOException e) {
			throw new Error(e + " in " + file);
		}
	}

	public void toSnoQuotes(String s) {
		try {
			w.write(s);
		} catch (IOException e) {
			throw new Error(e + " in " + file);
		}
	}


	void toB(boolean b) {
		try {
			w.write(b ? "1" : "0");
		} catch (IOException e) {
			throw new Error(e + " in " + file);
		}
	}

	public void nl() {
		offset = 0;
		line++;
		try {
			w.write("\n");
		} catch (IOException e) {
			throw new Error(e + " in " + file);
		}
	}

	void comma() {
		offset++;
		try {
			if (!DEBUG) w.write(",");
			else w.write("," + Reader.headers[offset] + "=");
		} catch (IOException e) {
			throw new Error(e + " in " + file);
		}
	}

	public void toD(double d) {
		try {
			w.write(Double.toString(d));
		} catch (IOException e) {
			throw new Error(e + " in " + file);
		}
	}
}
