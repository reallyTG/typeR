import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.HashSet;

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
		// collapsePerArg(the_file);

	}

  private static void collapsePerArg(String file) {
		Reader reader = null;
		try {
			reader = new Reader(file);
		} catch (IOException e) {
			throw new Error(e);
		}

		ArrayList<Signature> out = new ArrayList<>();
		ArrayList<HashSet<String>> sig_els = new ArrayList<>();
		HashSet<String> ret_t = new HashSet<>();
		HashSet<String> ret_c = new HashSet<>();
		HashSet<String> ret_a = new HashSet<>();
		for (int i = 0; i < 60; i ++) {
			sig_els.add(new HashSet<>());
		}

		Signature prev = null;
		for (Signature f : reader) {
			if (prev == null)
				prev = f;

			if (!prev.pkg.equals(f.pkg) || !prev.fun.equals(f.fun)) {
				// deal with change
				// flush into sig
				Signature put = flush(sig_els, prev);
				put.ret_t = ret_t.toString();
				put.ret_c = ret_c.toString();
				put.ret_a = ret_a.toString();
				out.add(put);

				sig_els = new ArrayList<>();
				for (int i = 0; i < 60; i ++) {
					sig_els.add(new HashSet<>());
				}

				ret_t = new HashSet<>();
				ret_c = new HashSet<>();
				ret_a = new HashSet<>();
			}

			// push strings in i guess
			pushAll(sig_els, f);
			ret_t.add(f.ret_t);
			ret_c.add(f.ret_c);
			ret_a.add(f.ret_a);

			prev = f;
		}

		// last flush
		Signature put = flush(sig_els, prev);
		put.ret_t = ret_t.toString();
		put.ret_c = ret_c.toString();
		put.ret_a = ret_a.toString();
		out.add(put);

		// write
		String out_file = file.substring(0, file.length()-7);
		out_file = out_file.concat("_collapsed.csv");
		Writer w = new Writer(out_file);
		for (Signature f : out) {
 			f.write(w);
		}
		w.close();
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
						} else if (ba) {
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
		int len = sigs.size();
		for (int i = 0; i < len - 1; i++) {
			Signature a = sigs.get(i);
			for (int j = i + 1; j < len; j++) {
				Signature b = sigs.get(j);
				boolean ab = a.isSubtypeL0(b);
				boolean ba = b.isSubtypeL0(a);
				if (ab && !ba) {
					a.pkg = "SUBTYPE";
				} else if (ba) {
					b.pkg = "SUBTYPE";
				}
			}
		}
		all.addAll(sigs);

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

	// please don't look at this hideous code im not proud of it at all
	private static Signature flush(ArrayList<HashSet<String>> in, Signature s) {
		s.arg1_t = in.get(0).toString();
		s.arg2_t = in.get(1).toString();
		s.arg3_t = in.get(2).toString();
		s.arg4_t = in.get(3).toString();
		s.arg5_t = in.get(4).toString();
		s.arg6_t = in.get(5).toString();
		s.arg7_t = in.get(6).toString();
		s.arg8_t = in.get(7).toString();
		s.arg9_t = in.get(8).toString();
		s.arg10_t = in.get(9).toString();
		s.arg11_t = in.get(10).toString();
		s.arg12_t = in.get(11).toString();
		s.arg13_t = in.get(12).toString();
		s.arg14_t = in.get(13).toString();
		s.arg15_t = in.get(14).toString();
		s.arg16_t = in.get(15).toString();
		s.arg17_t = in.get(16).toString();
		s.arg18_t = in.get(17).toString();
		s.arg19_t = in.get(18).toString();
		s.arg20_t = in.get(19).toString();
		s.arg1_c = in.get(20).toString();
		s.arg2_c = in.get(21).toString();
		s.arg3_c = in.get(22).toString();
		s.arg4_c = in.get(23).toString();
		s.arg5_c = in.get(24).toString();
		s.arg6_c = in.get(25).toString();
		s.arg7_c = in.get(26).toString();
		s.arg8_c = in.get(27).toString();
		s.arg9_c = in.get(28).toString();
		s.arg10_c = in.get(29).toString();
		s.arg11_c = in.get(30).toString();
		s.arg12_c = in.get(31).toString();
		s.arg13_c = in.get(32).toString();
		s.arg14_c = in.get(33).toString();
		s.arg15_c = in.get(34).toString();
		s.arg16_c = in.get(35).toString();
		s.arg17_c = in.get(36).toString();
		s.arg18_c = in.get(37).toString();
		s.arg19_c = in.get(38).toString();
		s.arg20_c = in.get(39).toString();
		s.arg1_a = in.get(40).toString();
		s.arg2_a = in.get(41).toString();
		s.arg3_a = in.get(42).toString();
		s.arg4_a = in.get(43).toString();
		s.arg5_a = in.get(44).toString();
		s.arg6_a = in.get(45).toString();
		s.arg7_a = in.get(46).toString();
		s.arg8_a = in.get(47).toString();
		s.arg9_a = in.get(48).toString();
		s.arg10_a = in.get(49).toString();
		s.arg11_a = in.get(50).toString();
		s.arg12_a = in.get(51).toString();
		s.arg13_a = in.get(52).toString();
		s.arg14_a = in.get(53).toString();
		s.arg15_a = in.get(54).toString();
		s.arg16_a = in.get(55).toString();
		s.arg17_a = in.get(56).toString();
		s.arg18_a = in.get(57).toString();
		s.arg19_a = in.get(58).toString();
		s.arg20_a = in.get(59).toString();
		return s;
	}

  // please don't look at this hideous code im not proud of it at all
	private static void pushAll(ArrayList<HashSet<String>> in, Signature s) {
		in.get(0).add(s.arg1_t);
		in.get(1).add(s.arg2_t);
		in.get(2).add(s.arg3_t);
		in.get(3).add(s.arg4_t);
		in.get(4).add(s.arg5_t);
		in.get(5).add(s.arg6_t);
		in.get(6).add(s.arg7_t);
		in.get(7).add(s.arg8_t);
		in.get(8).add(s.arg9_t);
		in.get(9).add(s.arg10_t);
		in.get(10).add(s.arg11_t);
		in.get(11).add(s.arg12_t);
		in.get(12).add(s.arg13_t);
		in.get(13).add(s.arg14_t);
		in.get(14).add(s.arg15_t);
		in.get(15).add(s.arg16_t);
		in.get(16).add(s.arg17_t);
		in.get(17).add(s.arg18_t);
		in.get(18).add(s.arg19_t);
		in.get(19).add(s.arg20_t);
		in.get(20).add(s.arg1_c);
		in.get(21).add(s.arg2_c);
		in.get(22).add(s.arg3_c);
		in.get(23).add(s.arg4_c);
		in.get(24).add(s.arg5_c);
		in.get(25).add(s.arg6_c);
		in.get(26).add(s.arg7_c);
		in.get(27).add(s.arg8_c);
		in.get(28).add(s.arg9_c);
		in.get(29).add(s.arg10_c);
		in.get(30).add(s.arg11_c);
		in.get(31).add(s.arg12_c);
		in.get(32).add(s.arg13_c);
		in.get(33).add(s.arg14_c);
		in.get(34).add(s.arg15_c);
		in.get(35).add(s.arg16_c);
		in.get(36).add(s.arg17_c);
		in.get(37).add(s.arg18_c);
		in.get(38).add(s.arg19_c);
		in.get(39).add(s.arg20_c);
		in.get(40).add(s.arg1_a);
		in.get(41).add(s.arg2_a);
		in.get(42).add(s.arg3_a);
		in.get(43).add(s.arg4_a);
		in.get(44).add(s.arg5_a);
		in.get(45).add(s.arg6_a);
		in.get(46).add(s.arg7_a);
		in.get(47).add(s.arg8_a);
		in.get(48).add(s.arg9_a);
		in.get(49).add(s.arg10_a);
		in.get(50).add(s.arg11_a);
		in.get(51).add(s.arg12_a);
		in.get(52).add(s.arg13_a);
		in.get(53).add(s.arg14_a);
		in.get(54).add(s.arg15_a);
		in.get(55).add(s.arg16_a);
		in.get(56).add(s.arg17_a);
		in.get(57).add(s.arg18_a);
		in.get(58).add(s.arg19_a);
		in.get(59).add(s.arg20_a);
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
