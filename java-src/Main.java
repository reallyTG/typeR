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

	// "enum"
	public static final int filename=0;
	public static final int pkg=1;
	public static final int fun=2;
	public static final int has_dots=3;
	public static final int arg1_t=4;
	public static final int arg2_t=5;
	public static final int arg3_t=6;
	public static final int arg4_t=7;
	public static final int arg5_t=8;
	public static final int arg6_t=9;
	public static final int arg7_t=10;
	public static final int arg8_t=11;
	public static final int arg9_t=12;
	public static final int arg10_t=13;
	public static final int arg11_t=14;
	public static final int arg12_t=15;
	public static final int arg13_t=16;
	public static final int arg14_t=17;
	public static final int arg15_t=18;
	public static final int arg16_t=19;
	public static final int arg17_t=20;
	public static final int arg18_t=21;
	public static final int arg19_t=22;
	public static final int arg20_t=23;
	public static final int arg1_c=24;
	public static final int arg2_c=25;
	public static final int arg3_c=26;
	public static final int arg4_c=27;
	public static final int arg5_c=28;
	public static final int arg6_c=29;
	public static final int arg7_c=30;
	public static final int arg8_c=31;
	public static final int arg9_c=32;
	public static final int arg10_c=33;
	public static final int arg11_c=34;
	public static final int arg12_c=35;
	public static final int arg13_c=36;
	public static final int arg14_c=37;
	public static final int arg15_c=38;
	public static final int arg16_c=39;
	public static final int arg17_c=40;
	public static final int arg18_c=41;
	public static final int arg19_c=42;
	public static final int arg20_c=43;
	public static final int arg1_a=44;
	public static final int arg2_a=45;
	public static final int arg3_a=46;
	public static final int arg4_a=47;
	public static final int arg5_a=48;
	public static final int arg6_a=49;
	public static final int arg7_a=50;
	public static final int arg8_a=51;
	public static final int arg9_a=52;
	public static final int arg10_a=53;
	public static final int arg11_a=54;
	public static final int arg12_a=55;
	public static final int arg13_a=56;
	public static final int arg14_a=57;
	public static final int arg15_a=58;
	public static final int arg16_a=59;
	public static final int arg17_a=60;
	public static final int arg18_a=61;
	public static final int arg19_a=62;
	public static final int arg20_a=63;
	public static final int ret_t=64;
	public static final int ret_c=65;
	public static final int ret_a=66;

	public static String file_prefix = "";

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

		// file prefix, if you dont just want to deal with L0 and shit
		file_prefix = "plus_80_";

		// args = getFileList(inputDir);
		// for (int i = 0; i < args.length; i++)
		String the_file = "../data/" + file_prefix + "L0.csv.gz";
		if (ts.equals("L1"))
		  // the_file = "../data/L1_sanitized_class.csv.gz";
			the_file = "../data/" + file_prefix + "L1.csv.gz";

		// uncomment depending on what you want to do
		// not the best approach
		// doIt(the_file, 0);
	  // collapsePerArg(the_file);
		// makeOccurences(the_file, false);

		sanitizeClass(the_file); // here
		doIt_L2(the_file);
		collapsePerArg_L2(the_file);
		makeOccurences(the_file, true); // do this but uncomment the L2 file names

		// makeOccurences_L2(the_file); // bad dont use

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
			if (prev.theMap.get(pkg).equals(f.theMap.get(pkg)) && prev.theMap.get(fun).equals(f.theMap.get(fun))) {
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
							a.theMap.put(pkg, "SUBTYPE");
						} else if (ba) {
							b.theMap.put(pkg, "SUBTYPE");
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
					a.theMap.put(pkg, "SUBTYPE");
				} else if (ba) {
					b.theMap.put(pkg, "SUBTYPE");
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

	private static void sanitizeClass(String file) {
		Reader reader = null;
		try {
			reader = new Reader(file);
		} catch (IOException e) {
			throw new Error(e);
		}

		ArrayList<Signature> out = new ArrayList<>();
		for (Signature f : reader) {
			if (f.theMap.get(ret_t).equals("ret_t")) {
				out.add(f);
				continue;
			}
			f.sanitizeClass();
			out.add(f);
		}

		String out_file = file.substring(0, file.length()-7);
		out_file = out_file.concat("_sanitized_class.csv");
		Writer w = new Writer(out_file);
		for (Signature f : out) {
			f.write(w);
		}
		w.close();
	}

	private static void makeOccurences(String file, boolean isL2) {
		String the_real_file = "";
		if (!isL2)
			the_real_file = file.substring(0, file.length()-7) + "_collapsed.csv.gz";
		else
			the_real_file = file.substring(0, file.length()-7) + "_collapsed_L2_new.csv.gz";
		Reader reader = null;
		try {
			reader = new Reader(the_real_file);
		} catch (IOException e) {
			throw new Error(e);
		}

		HashMap<String, Integer> map = new HashMap<>();

		for (Signature f : reader) {
			if (f.theMap.get(ret_t).equals("ret_t"))
				continue;
			mapTypes(map, f);
		}

		String out_file = file.substring(0, file.length()-7);
		if (!isL2)
			out_file = out_file.concat("_arg_sig_counts.csv");
		else
			out_file = out_file.concat("_arg_sig_counts_L2.csv");
		Writer w = new Writer(out_file);
		w.toS("arg_sig");
		w.comma();
		w.toS("count");
		w.nl();
		for (HashMap.Entry<String, Integer> entry : map.entrySet()) {
			w.toS(entry.getKey());
			w.comma();
			w.toI(entry.getValue());
			w.nl();
		}
		w.close();

	}

/*
	private static void makeOccurences_L2(String file) {
		String the_real_file = file.substring(0, file.length()-7) + "_collapsed.csv.gz";
		Reader reader = null;
		try {
			reader = new Reader(the_real_file);
		} catch (IOException e) {
			throw new Error(e);
		}

		HashMap<String, Integer> map = new HashMap<>();

		for (Signature f : reader) {
			if (f.theMap.get(ret_t).equals("ret_t"))
				continue;
			mapTypes_L2(map, f);
		}

		String out_file = file.substring(0, file.length()-7);
		out_file = out_file.concat("_arg_sig_counts_L2.csv");
		Writer w = new Writer(out_file);
		w.toS("arg_sig");
		w.comma();
		w.toS("count");
		w.nl();
		for (HashMap.Entry<String, Integer> entry : map.entrySet()) {
			w.toS(entry.getKey());
			w.comma();
			w.toI(entry.getValue());
			w.nl();
		}
		w.close();

	}
*/

	private static void collapsePerArg(String file) {
		Reader reader = null;
		try {
			reader = new Reader(file);
		} catch (IOException e) {
			throw new Error(e);
		}

		ArrayList<Signature> out = new ArrayList<>();
		ArrayList<HashSet<String>> sig_els = new ArrayList<>();
		HashSet<String> set_ret_t = new HashSet<>();
		HashSet<String> set_ret_c = new HashSet<>();
		HashSet<String> set_ret_a = new HashSet<>();
		for (int i = 0; i < 60; i ++) {
			sig_els.add(new HashSet<>());
		}

		Signature prev = null;
		for (Signature f : reader) {
			if (prev == null)
				prev = f;

			if (!prev.theMap.get(pkg).equals(f.theMap.get(pkg)) || !prev.theMap.get(fun).equals(f.theMap.get(fun))) {
				// deal with change
				// flush into sig
				Signature put = flush(sig_els, prev);
				put.theMap.put(ret_t, set_ret_t.toString());
				put.theMap.put(ret_c, set_ret_c.toString());
				put.theMap.put(ret_a, set_ret_a.toString());
				out.add(put);

				sig_els = new ArrayList<>();
				for (int i = 0; i < 60; i ++) {
					sig_els.add(new HashSet<>());
				}

				set_ret_t = new HashSet<>();
				set_ret_c = new HashSet<>();
				set_ret_a = new HashSet<>();
			}

			// push strings in i guess
			pushAll(sig_els, f);
			set_ret_t.add(f.theMap.get(ret_t));
			set_ret_c.add(f.theMap.get(ret_c));
			set_ret_a.add(f.theMap.get(ret_a));

			prev = f;
		}

		// last flush
		Signature put = flush(sig_els, prev);
		put.theMap.put(ret_t, set_ret_t.toString());
		put.theMap.put(ret_c, set_ret_c.toString());
		put.theMap.put(ret_a, set_ret_a.toString());
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

	private static String L2_combo(String t, String c, String a) {
		String r = "";

		if (t.equals(""))
			return ""; 			// nothing to do

		r += t;

		if (!c.equals("[]"))
			r += "@c{" + c + "}";

		if (!a.equals("[]"))
			r += "@a[" + a + "]";

		return r;
	}

	private static void doIt_L2(String file) {
		String the_real_file = file.substring(0, file.length()-7) + "_sanitized_class.csv.gz";
		Reader reader = null;
		try {
			reader = new Reader(the_real_file);
		} catch (IOException e) {
			throw new Error(e);
		}
		Signature prev = null;
		ArrayList<Signature> all = new ArrayList<>();
		ArrayList<Signature> sigs = new ArrayList<>();
		for (Signature f : reader) {
			if (prev == null)
				prev = f;
			if (prev.theMap.get(pkg).equals(f.theMap.get(pkg)) && prev.theMap.get(fun).equals(f.theMap.get(fun))) {
				sigs.add(f);
			} else {
				int len = sigs.size();
				for (int i = 0; i < len - 1; i++) {
					Signature a = sigs.get(i);
					for (int j = i + 1; j < len; j++) {
						Signature b = sigs.get(j);
						boolean ab = false;
						boolean ba = false;
						ab = a.isSubtypeL2(b);
						ba = b.isSubtypeL2(a);
						if (ab && !ba) {
							a.theMap.put(pkg, "SUBTYPE");
						} else if (ba) {
							b.theMap.put(pkg, "SUBTYPE");
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
				boolean ab = a.isSubtypeL2(b);
				boolean ba = b.isSubtypeL2(a);
				if (ab && !ba) {
					a.theMap.put(pkg, "SUBTYPE");
				} else if (ba) {
					b.theMap.put(pkg, "SUBTYPE");
				}
			}
		}
		all.addAll(sigs);

		// write all
		String out_file = file.substring(0, file.length()-7);
		out_file = out_file.concat("_L2.csv");
		Writer w = new Writer(out_file);
		for (Signature f : all) {
			f.write(w);
		}
		w.close();
	}

	private static void collapsePerArg_L2(String file) {

		String the_real_file = file.substring(0, file.length()-7) + "_sanitized_class.csv.gz";
		Reader reader = null;
		try {
			reader = new Reader(the_real_file);
		} catch (IOException e) {
			throw new Error(e);
		}

		ArrayList<Signature> out = new ArrayList<>();
		ArrayList<HashSet<String>> sig_els = new ArrayList<>();
		HashSet<String> set_ret_t = new HashSet<>();
		HashSet<String> set_ret_c = new HashSet<>();
		HashSet<String> set_ret_a = new HashSet<>();
		for (int i = 0; i < 60; i ++) {
			sig_els.add(new HashSet<>());
		}

		Signature prev = null;
		for (Signature f : reader) {
			if (f.theMap.get(ret_t).equals("ret_t")) {
				out.add(f);
				continue;
			}

			if (prev == null)
				prev = f;

			if (!prev.theMap.get(pkg).equals(f.theMap.get(pkg)) || !prev.theMap.get(fun).equals(f.theMap.get(fun))) {
				// deal with change
				// flush into sig
				Signature put = flush(sig_els, prev);
				put.theMap.put(ret_t, set_ret_t.toString());
				put.theMap.put(ret_c, set_ret_c.toString());
				put.theMap.put(ret_a, set_ret_a.toString());
				out.add(put);

				sig_els = new ArrayList<>();
				for (int i = 0; i < 60; i ++) {
					sig_els.add(new HashSet<>());
				}

				set_ret_t = new HashSet<>();
				set_ret_c = new HashSet<>();
				set_ret_a = new HashSet<>();
			}

			// push strings in i guess
			pushAll_L2(sig_els, f);
			set_ret_t.add(f.theMap.get(ret_t) + "/" + f.theMap.get(ret_c) + "/" + f.theMap.get(ret_a));
			set_ret_c.addAll(Arrays.asList(f.theMap.get(ret_c).split(",")));
			if (!f.theMap.get(ret_a).equals("") && !f.theMap.get(ret_a).equals("{}"))
				set_ret_a.addAll(Arrays.asList(f.theMap.get(ret_a).substring(1, f.theMap.get(ret_a).length()-1).split(",")));
			// else
			// 	ret_a.add("");

			prev = f;
		}

		// last flush
		Signature put = flush(sig_els, prev);
		put.theMap.put(ret_t, set_ret_t.toString());
		put.theMap.put(ret_c, set_ret_c.toString());
		put.theMap.put(ret_a, set_ret_a.toString());
		out.add(put);

		// write
		String out_file = file.substring(0, file.length()-7);
		out_file = out_file.concat("_collapsed_L2_new.csv");
		Writer w = new Writer(out_file);
		for (Signature f : out) {
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

	static String al_ts(ArrayList<String> ts) {
		String r = "";
		int len = ts.size();
		for (int i = 0; i < len; i++) {
			r += ts.get(i);
			if (i != len-1)
				r += ",";
		}
		return r;
	}

	private static Signature flush_L2(ArrayList<HashSet<String>> in, Signature s) {
		ArrayList<String> m = new ArrayList<String>(in.get(0));

		for (int i = arg1_t; i <= arg20_a; i++) {
			int j = 1;
			Collections.sort(m);
			s.theMap.put(i, al_ts(m));
			if (i != arg20_a)
				m = new ArrayList<>(in.get(i - arg1_t +1));
		}

		return s;
	}

	// same as above?
	private static Signature flush(ArrayList<HashSet<String>> in, Signature s) {
		ArrayList<String> m = new ArrayList<String>(in.get(0));

		for (int i = arg1_t; i <= arg20_a; i++) {
			Collections.sort(m);
			s.theMap.put(i, al_ts(m));
			if (i != arg20_a)
				m = new ArrayList<>(in.get(i - arg1_t + 1));
		}

		return s;
	}

	private static void mapTypes(HashMap<String, Integer> map, Signature s) {

		for (int i = arg1_t; i <= arg20_t; i++) {
			if (map.containsKey(s.theMap.get(i)))
				map.put(s.theMap.get(i), map.get(s.theMap.get(i)) + 1);
			else
				map.put(s.theMap.get(i), 1);
		}

		if (map.containsKey(s.theMap.get(ret_t)))
			map.put(s.theMap.get(ret_t), map.get(s.theMap.get(ret_t)) + 1);
		else
			map.put(s.theMap.get(ret_t), 1);
	}

	private static void mapTypes_L2(HashMap<String, Integer> map, Signature s) {
		String key;

		for (int i = arg1_t; i <= arg20_a; i++) {
			key = s.theMap.get(i) + "/" + s.theMap.get(i+20) + "/" + s.theMap.get(i+40);
			if (map.containsKey(key))
				map.put(key, map.get(key) + 1);
			else
				map.put(key, 1);
		}

		key = s.theMap.get(ret_t) + "/" + s.theMap.get(ret_c) + "/" + s.theMap.get(ret_a);
		if (map.containsKey(key))
			map.put(key, map.get(key) + 1);
		else
			map.put(key, 1);
	}

  // please don't look at this hideous code im not proud of it at all
	private static void pushAll(ArrayList<HashSet<String>> in, Signature s) {
		for (int i = arg1_t; i <= arg20_a; i++) {
			in.get(i - arg1_t).add(s.theMap.get(i));
		}
	}

	private static void pushAll_L2(ArrayList<HashSet<String>> in, Signature s) {
		// types
		for (int i = arg1_t; i <= arg20_t; i++) {
			in.get(i - arg1_t).add(s.theMap.get(i) + "/" + s.theMap.get(i+20) + "/" + s.theMap.get(i+40));
		}

		// classes
		for (int i = arg1_c; i <= arg20_c; i++) {
			in.get(i - arg1_c + 20).addAll(Arrays.asList(s.theMap.get(i).split(",")));
		}

		// attributes
		for (int i = arg1_a; i <= arg20_a; i++) {
			if (!s.theMap.get(i).equals("") && !s.theMap.get(i).equals("{}"))
				in.get(i - arg1_a + 40).addAll(Arrays.asList(s.theMap.get(i).substring(1, s.theMap.get(i).length()-1).split(",")));
		}
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
