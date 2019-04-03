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
	static String ts;

	/**
	 * @param args The name of the CSV files to be processed prefixed with command
	 *             line arguments. "-p" request parallel processing, "-p=N" requests
	 *             parallel processing with a thread pool of size 8. The currently
	 *             supported values of "-query" are "Duration", "Squeeze", "Price",
	 *             "A_0". "-s" indicates that the files have been Squeezed.
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		Args args_ = new Args(args);

		if (args.length == 0) {
			ts = "L0";
		} else {
			ts = args_.getOption("-L");
		}

		inputDir = args_.getOption("-input");
		outputDir = args_.getOption("-output");

		// args = getFileList(inputDir);
		// for (int i = 0; i < args.length; i++)
		String the_file = "../data/partial_L0.csv.gz";
		if (ts.equals("L1"))
		  the_file = "../data/partial_L1.csv.gz";

		doIt(the_file, 0);

	}

	/* Factoring some common code out. */
	private static void doIt(String file, int noti) {
		Reader reader = null;
		try {
			reader = new Reader(file);
		} catch (IOException e) {
			throw new Error(e);
		}
		Signature prev = null;
		ArrayList<Signature> all = new ArrayList<>();
		ArrayList<Signature> sigs = new ArrayList<>();
		for (Signature f : reader) {
			if (prev == null)
				prev = f;
			if (prev.pkg.equals(f.pkg) && prev.fun.equals(f.fun)) {
				sigs.add(f);
			} else {
				int len = sigs.size();
				for (int i = 0; i < len - 1; i++) {
					Signature a = sigs.get(i);
					for (int j = i + 1; j < len; j++) {
						Signature b = sigs.get(j);
						boolean ab = false;
						boolean ba = false;
						if (ts.equals("L0")) {
							ab = a.isSubtypeL0(b);
							ba = b.isSubtypeL0(a);
						} else if (ts.equals("L1")) {
							ab = a.isSubtypeL1(b);
							ba = b.isSubtypeL1(a);
						}
						if (ab && !ba) {
							a.pkg = "SUBTYPE";
						} else if (ba && !ab) {
							b.pkg = "SUBTYPE";
						}
					}
				}
				all.addAll(sigs);
				sigs = new ArrayList<>();
				sigs.add(f);
				prev = f;
			}
		}
		// write all
		String out_file = file.substring(0, file.length()-7);
		out_file = out_file.concat("_subtype.csv");
		Writer w = new Writer(out_file);
		for (Signature f : all) {
			f.write(w);
		}
		w.close();
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
