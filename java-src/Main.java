import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

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

		// uncomment depending on what you want to do
		// not the best approach
		doIt(the_file, 0);
		// collapsePerArg(the_file);
		// makeOccurences(the_file);

	}

	private static void makeOccurences(String file) {
		String the_real_file = file.substring(0, file.length()-7) + "_collapsed.csv.gz";
		Reader reader = null;
		try {
			reader = new Reader(the_real_file);
		} catch (IOException e) {
			throw new Error(e);
		}

		HashMap<String, Integer> map = new HashMap<>();

		for (Signature f : reader) {
			mapTypes(map, f);
		}

		String out_file = file.substring(0, file.length()-7);
		out_file = out_file.concat("_arg_sig_counts.csv");
		Writer w = new Writer(out_file);
		for (HashMap.Entry<String, Integer> entry : map.entrySet()) {
			w.toS(entry.getKey());
			w.comma();
			w.toI(entry.getValue());
			w.nl();
		}
		w.close();

	}

	private static void mapTypes(HashMap<String, Integer> map, Signature s) {
		if (map.containsKey(s.arg1_t))
			map.put(s.arg1_t, map.get(s.arg1_t) + 1);
		else
			map.put(s.arg1_t, 1);

		if (map.containsKey(s.arg2_t))
			map.put(s.arg2_t, map.get(s.arg2_t) + 1);
		else
			map.put(s.arg2_t, 1);

		if (map.containsKey(s.arg3_t))
			map.put(s.arg3_t, map.get(s.arg3_t) + 1);
		else
			map.put(s.arg3_t, 1);

		if (map.containsKey(s.arg4_t))
			map.put(s.arg4_t, map.get(s.arg4_t) + 1);
		else
			map.put(s.arg4_t, 1);

		if (map.containsKey(s.arg5_t))
			map.put(s.arg5_t, map.get(s.arg5_t) + 1);
		else
			map.put(s.arg5_t, 1);

		if (map.containsKey(s.arg6_t))
			map.put(s.arg6_t, map.get(s.arg6_t) + 1);
		else
			map.put(s.arg6_t, 1);

		if (map.containsKey(s.arg7_t))
			map.put(s.arg7_t, map.get(s.arg7_t) + 1);
		else
			map.put(s.arg7_t, 1);

		if (map.containsKey(s.arg8_t))
			map.put(s.arg8_t, map.get(s.arg8_t) + 1);
		else
			map.put(s.arg8_t, 1);

		if (map.containsKey(s.arg9_t))
			map.put(s.arg9_t, map.get(s.arg9_t) + 1);
		else
			map.put(s.arg9_t, 1);

		if (map.containsKey(s.arg10_t))
			map.put(s.arg10_t, map.get(s.arg10_t) + 1);
		else
			map.put(s.arg10_t, 1);

		if (map.containsKey(s.arg11_t))
			map.put(s.arg11_t, map.get(s.arg11_t) + 1);
		else
			map.put(s.arg11_t, 1);

		if (map.containsKey(s.arg12_t))
			map.put(s.arg12_t, map.get(s.arg12_t) + 1);
		else
			map.put(s.arg12_t, 1);

		if (map.containsKey(s.arg13_t))
			map.put(s.arg13_t, map.get(s.arg13_t) + 1);
		else
			map.put(s.arg13_t, 1);

		if (map.containsKey(s.arg14_t))
			map.put(s.arg14_t, map.get(s.arg14_t) + 1);
		else
			map.put(s.arg14_t, 1);

		if (map.containsKey(s.arg15_t))
			map.put(s.arg15_t, map.get(s.arg15_t) + 1);
		else
			map.put(s.arg15_t, 1);

		if (map.containsKey(s.arg16_t))
			map.put(s.arg16_t, map.get(s.arg16_t) + 1);
		else
			map.put(s.arg16_t, 1);

		if (map.containsKey(s.arg17_t))
			map.put(s.arg17_t, map.get(s.arg17_t) + 1);
		else
			map.put(s.arg17_t, 1);

		if (map.containsKey(s.arg18_t))
			map.put(s.arg18_t, map.get(s.arg18_t) + 1);
		else
			map.put(s.arg18_t, 1);

		if (map.containsKey(s.arg19_t))
			map.put(s.arg19_t, map.get(s.arg19_t) + 1);
		else
			map.put(s.arg19_t, 1);

		if (map.containsKey(s.ret_t))
			map.put(s.ret_t, map.get(s.ret_t) + 1);
		else
			map.put(s.ret_t, 1);
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
		ArrayList<String> m = new ArrayList<String>(in.get(0));
		Collections.sort(m);
		s.arg1_t = m.toString();
		m = new ArrayList<>(in.get(1));
		Collections.sort(m);
		s.arg2_t = m.toString();
		m = new ArrayList<>(in.get(2));
		Collections.sort(m);
		s.arg3_t = m.toString();
		m = new ArrayList<>(in.get(3));
		Collections.sort(m);
		s.arg4_t = m.toString();
		m = new ArrayList<>(in.get(4));
		Collections.sort(m);
		s.arg5_t = m.toString();
		m = new ArrayList<>(in.get(5));
		Collections.sort(m);
		s.arg6_t = m.toString();
		m = new ArrayList<>(in.get(6));
		Collections.sort(m);
		s.arg7_t = m.toString();
		m = new ArrayList<>(in.get(7));
		Collections.sort(m);
		s.arg8_t = m.toString();
		m = new ArrayList<>(in.get(8));
		Collections.sort(m);
		s.arg9_t = m.toString();
		m = new ArrayList<>(in.get(9));
		Collections.sort(m);
		s.arg10_t = m.toString();
		m = new ArrayList<>(in.get(10));
		Collections.sort(m);
		s.arg11_t = m.toString();
		m = new ArrayList<>(in.get(11));
		Collections.sort(m);
		s.arg12_t = m.toString();
		m = new ArrayList<>(in.get(12));
		Collections.sort(m);
		s.arg13_t = m.toString();
		m = new ArrayList<>(in.get(13));
		Collections.sort(m);
		s.arg14_t = m.toString();
		m = new ArrayList<>(in.get(14));
		Collections.sort(m);
		s.arg15_t = m.toString();
		m = new ArrayList<>(in.get(15));
		Collections.sort(m);
		s.arg16_t = m.toString();
		m = new ArrayList<>(in.get(16));
		Collections.sort(m);
		s.arg17_t = m.toString();
		m = new ArrayList<>(in.get(17));
		Collections.sort(m);
		s.arg18_t = m.toString();
		m = new ArrayList<>(in.get(18));
		Collections.sort(m);
		s.arg19_t = m.toString();
		m = new ArrayList<>(in.get(19));
		Collections.sort(m);
		s.arg20_t = m.toString();
		m = new ArrayList<>(in.get(20));
		Collections.sort(m);
		s.arg1_c = m.toString();
		m = new ArrayList<>(in.get(21));
		Collections.sort(m);
		s.arg2_c = m.toString();
		m = new ArrayList<>(in.get(22));
		Collections.sort(m);
		s.arg3_c = m.toString();
		m = new ArrayList<>(in.get(23));
		Collections.sort(m);
		s.arg4_c = m.toString();
		m = new ArrayList<>(in.get(24));
		Collections.sort(m);
		s.arg5_c = m.toString();
		m = new ArrayList<>(in.get(25));
		Collections.sort(m);
		s.arg6_c = m.toString();
		m = new ArrayList<>(in.get(26));
		Collections.sort(m);
		s.arg7_c = m.toString();
		m = new ArrayList<>(in.get(27));
		Collections.sort(m);
		s.arg8_c = m.toString();
		m = new ArrayList<>(in.get(28));
		Collections.sort(m);
		s.arg9_c = m.toString();
		m = new ArrayList<>(in.get(29));
		Collections.sort(m);
		s.arg10_c = m.toString();
		m = new ArrayList<>(in.get(30));
		Collections.sort(m);
		s.arg11_c = m.toString();
		m = new ArrayList<>(in.get(31));
		Collections.sort(m);
		s.arg12_c = m.toString();
		m = new ArrayList<>(in.get(32));
		Collections.sort(m);
		s.arg13_c = m.toString();
		m = new ArrayList<>(in.get(33));
		Collections.sort(m);
		s.arg14_c = m.toString();
		m = new ArrayList<>(in.get(34));
		Collections.sort(m);
		s.arg15_c = m.toString();
		m = new ArrayList<>(in.get(35));
		Collections.sort(m);
		s.arg16_c = m.toString();
		m = new ArrayList<>(in.get(36));
		Collections.sort(m);
		s.arg17_c = m.toString();
		m = new ArrayList<>(in.get(37));
		Collections.sort(m);
		s.arg18_c = m.toString();
		m = new ArrayList<>(in.get(38));
		Collections.sort(m);
		s.arg19_c = m.toString();
		m = new ArrayList<>(in.get(39));
		Collections.sort(m);
		s.arg20_c = m.toString();
		m = new ArrayList<>(in.get(40));
		Collections.sort(m);
		s.arg1_a = m.toString();
		m = new ArrayList<>(in.get(41));
		Collections.sort(m);
		s.arg2_a = m.toString();
		m = new ArrayList<>(in.get(42));
		Collections.sort(m);
		s.arg3_a = m.toString();
		m = new ArrayList<>(in.get(43));
		Collections.sort(m);
		s.arg4_a = m.toString();
		m = new ArrayList<>(in.get(44));
		Collections.sort(m);
		s.arg5_a = m.toString();
		m = new ArrayList<>(in.get(45));
		Collections.sort(m);
		s.arg6_a = m.toString();
		m = new ArrayList<>(in.get(46));
		Collections.sort(m);
		s.arg7_a = m.toString();
		m = new ArrayList<>(in.get(47));
		Collections.sort(m);
		s.arg8_a = m.toString();
		m = new ArrayList<>(in.get(48));
		Collections.sort(m);
		s.arg9_a = m.toString();
		m = new ArrayList<>(in.get(49));
		Collections.sort(m);
		s.arg10_a = m.toString();
		m = new ArrayList<>(in.get(50));
		Collections.sort(m);
		s.arg11_a = m.toString();
		m = new ArrayList<>(in.get(51));
		Collections.sort(m);
		s.arg12_a = m.toString();
		m = new ArrayList<>(in.get(52));
		Collections.sort(m);
		s.arg13_a = m.toString();
		m = new ArrayList<>(in.get(53));
		Collections.sort(m);
		s.arg14_a = m.toString();
		m = new ArrayList<>(in.get(54));
		Collections.sort(m);
		s.arg15_a = m.toString();
		m = new ArrayList<>(in.get(55));
		Collections.sort(m);
		s.arg16_a = m.toString();
		m = new ArrayList<>(in.get(56));
		Collections.sort(m);
		s.arg17_a = m.toString();
		m = new ArrayList<>(in.get(57));
		Collections.sort(m);
		s.arg18_a = m.toString();
		m = new ArrayList<>(in.get(58));
		Collections.sort(m);
		s.arg19_a = m.toString();
		m = new ArrayList<>(in.get(59));
		Collections.sort(m);
		s.arg20_a = m.toString();
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
