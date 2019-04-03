import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Main file for running all queries.
 * 
 * Average CRS flight times 125 minutes (for all files) and 147,735,126 flights.
 * 
 * @author jv
 */
public class Main {
	static String inputDir;
	static String outputDir;

	/**
	 * @param args The name of the CSV files to be processed prefixed with command
	 *             line arguments. "-p" request parallel processing, "-p=N" requests
	 *             parallel processing with a thread pool of size 8. The currently
	 *             supported values of "-query" are "Duration", "Squeeze", "Price",
	 *             "A_0". "-s" indicates that the files have been Squeezed.
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		if (args.length == 0)
			args = new String[] { "../data/per_partial.csv.gz" };
		Args args_ = new Args(args);
		inputDir = args_.getOption("-input");
		outputDir = args_.getOption("-output");
		Reader empty = new Reader();
		args = getFileList(inputDir);
		for (int i = 0; i < args.length; i++)
			doIt(args[i], i);

	}

	/* Factoring some common code out. */
	private static void doIt(String file, int i) {
		Reader reader = null;
		try {
			reader = new Reader(file);
		} catch (IOException e) {
			throw new Error(e);
		}
		for (Signature f : reader) {
		}
	}

	private static String[] getFileList(String dir) {
		List<String> res = new ArrayList<String>();
		File[] files = new File(dir).listFiles();
		for (File file : files)
			if (file.isFile() && file.getName().endsWith(".csv.gz"))
				res.add(dir + "/" + file.getName());
		return res.toArray(new String[0]);
	}

	/**
	 * Simple command line argument processing
	 * 
	 * @author Jan Vitek
	 */
	static class Args {
		Args(String[] args) {
			this.args = args;
		}

		String[] args;

		boolean getFlag(String flag) {
			boolean found = false;
			for (int i = 0; i < args.length; i++)
				if (found = args[i].equals(flag)) {
					args[i] = args[0];
					args = Arrays.copyOfRange(args, 1, args.length);
					break;
				}
			return found;
		}

		String getOption(String opt) {
			opt += "=";
			for (int i = 0; i < args.length; i++)
				if (args[i].startsWith(opt)) {
					String value = args[i].replaceAll(opt, "");
					args[i] = args[0];
					args = Arrays.copyOfRange(args, 1, args.length);
					return value;
				}
			return null;
		}

		int length() {
			return args.length;
		}

		String[] get() {
			return args;
		}

		@Override
		public String toString() {
			String res = "";
			for (String s : args)
				res += s + " ";
			return res;
		}
	}
}
