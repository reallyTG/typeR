import java.util.Set;
import java.util.HashSet;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.HashMap;

// enum Name {
// 	filename, pkg, fun, has_dots,
// 	arg1_t,  arg2_t,  arg3_t,  arg4_t,  arg5_t,  arg6_t,  arg7_t,  arg8_t,  arg9_t,  arg10_t,
// 	arg11_t, arg12_t, arg13_t, arg14_t, arg15_t, arg16_t, arg17_t, arg18_t, arg19_t, arg20_t,
// 	arg1_c,  arg2_c,  arg3_c,  arg4_c,  arg5_c,  arg6_c,  arg7_c,  arg8_c,  arg9_c,  arg10_c,
// 	arg11_c, arg12_c, arg13_c, arg14_c, arg15_c, arg16_c, arg17_c, arg18_c, arg19_c, arg20_c,
// 	arg1_a,  arg2_a,  arg3_a,  arg4_a,  arg5_a,  arg6_a,  arg7_a,  arg8_a,  arg9_a,  arg10_a,
// 	arg11_a, arg12_a, arg13_a, arg14_a, arg15_a, arg16_a, arg17_a, arg18_a, arg19_a, arg20_a,
// 	ret_t, ret_c, ret_a
// }

/**
 * Denotes one flight. Representing missing values is tricky. There are many
 * fields which should not be missing, for those we will treat missing value as
 * errors, and discard the whole flight. On the other hand a few fields are
 * almost always missing. We use different representations of missing in
 * different cases.
 *
 * @author jan
 */
public class Signature {
	public HashMap<Integer, String> theMap = new HashMap<Integer, String>();
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

	// set this manually to enable the simplifcation of types
	static boolean simplify = true;

	boolean isSubtypeL0(String a, String b) {
		if (b.equals("?"))
			return true;
		if (a.equals("L") && b.equals("I"))
			return true;
		if (a.equals("L") && b.equals("D"))
			return true;
		if (a.equals("I") && b.equals("D"))
			return true;
		if (a.equals("unevaled"))
			return true;
		if (a.equals("missing"))
			return true;
		if (a.equals("error"))
			return true;
		return a.equals(b);
	}

	boolean isSubtypeL1(String a, String b) {
		if (b.equals("?"))
			return true;
		if (a.equals("sL") && b.equals("L")) 		// scalar <: vector
			return true; // will collapse scalar/vector where appropriate
		if (a.equals("sI") && b.equals("I"))
			return true; // will collapse scalar/vector where appropriate
		if (a.equals("sD") && b.equals("D"))
			return true; // will collapse scalar/vector where appropriate
		if (a.equals("sC") && b.equals("C"))
			return true; // will collapse scalar/vector where appropriate
		if (a.equals("sR") && b.equals("R"))
			return true; // will collapse scalar/vector where appropriate
		if (a.equals("sX") && b.equals("X"))
			return true; // will collapse scalar/vector where appropriate
		if (a.equals("sL") && b.equals("sD"))			// logical <: double
			return true;
		if (a.equals("sL") && b.equals("D"))			// logical <: double
			return true;
		if (a.equals("L") && b.equals("D"))			// logical <: double
			return true;
		if (a.equals("sL") && b.equals("sI"))			// logical <: int
			return true;
		if (a.equals("sL") && b.equals("I"))			// logical <: int
			return true;
		if (a.equals("L") && b.equals("I"))			// logical <: int
			return true;
		if (a.equals("sI") && b.equals("sD"))			// int <: double
			return true;
		if (a.equals("sI") && b.equals("D"))			// int <: double
			return true;
		if (a.equals("I") && b.equals("D"))			// int <: double
			return true;
		if (a.equals("unevaled"))																					// unevaled <: T
			return true;
		if (a.equals("missing"))																					// missing <: T
			return true;
		if (a.equals("sN"))																							// null <: T
			return true;
		if (a.equals("error"))
			return true;
		return a.equals(b);
	}

	boolean isSubtypeL2_a(String a, String b) {
		// going for subsetting here
		if (a.equals("{}"))
			return true;
		if (a.equals(""))		// will match
			return true;

    HashSet<String> as = new HashSet<String>(Arrays.asList(a.substring(1, a.length()-1).split(",")));
		HashSet<String> bs = new HashSet<String>(Arrays.asList(b.substring(1, b.length()-1).split(",")));

		return bs.containsAll(as);
	}

	boolean isSubtypeL2_c(String a, String b) {
		// going for subsetting again here
		if (a.equals(""))		// will match
			return true;

    HashSet<String> as = new HashSet<String>(Arrays.asList(a.split(",")));
		HashSet<String> bs = new HashSet<String>(Arrays.asList(b.split(",")));

		return bs.containsAll(as);
	}

	public static final String[] primitiveClasses = new String[] { "character","complex","double","expression","integer","list","logical",
	 "numeric","single","raw","matrix","data.frame","NULL","factor","function","unevaled","missing","error" };
	public static final HashSet<String> primitiveClassesSet = new HashSet<>(Arrays.asList(primitiveClasses));

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

	static String al_ts_a(ArrayList<String> ts) {
		String r = "{";
		int len = ts.size();
		for (int i = 0; i < len; i++) {
			r += ts.get(i);
			if (i != len-1)
				r += ",";
		}
		return r + "}";
	}

	void sanitizeClass() {
		int i, j;
		ArrayList<String> lookingAt;

		// sanitize types -- remove raw_NA
		for (i = arg1_t; i <= arg20_t; i ++) {
			if (theMap.get(i).equals("raw_NA"))
				theMap.put(i, "null");
		}

		// ret_t
		if (theMap.get(ret_t).equals("raw_NA"))
			theMap.put(ret_t, "null");

		// sanitize classes -- removing all primitive ones
		for (i = arg1_c; i <= arg20_c; i ++) {
			if (theMap.get(i).equals("")) {
				lookingAt = new ArrayList<String>(Arrays.asList(theMap.get(i).split(",")));
				for (j = 0; j < lookingAt.size(); j++) {
					if(primitiveClassesSet.contains(lookingAt.get(j)))
						lookingAt.remove(j);
				}
				theMap.put(i, al_ts(lookingAt));
			}
		}

		// ret_c
		if (theMap.get(ret_c).equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(theMap.get(ret_c).split(",")));
			for (j = 0; j < lookingAt.size(); j++) {
				if(primitiveClassesSet.contains(lookingAt.get(j)))
					lookingAt.remove(j);
			}
			theMap.put(ret_c, al_ts(lookingAt));
		}

		// sanitize attributes -- remove class, as if it's important it'll be in
		for (i = arg1_a; i <= arg20_a; i ++) {
			if (theMap.get(i).length() > 0 && !theMap.get(i).equals("{}")) {
				lookingAt = new ArrayList<String>(Arrays.asList(theMap.get(i).substring(1, theMap.get(i).length()-1).split(",")));
				for (j = 0; j < lookingAt.size(); j++) {
					if(lookingAt.get(j).equals("class"))
						lookingAt.remove(j);
				}
				theMap.put(i, al_ts_a(lookingAt));
			}
		}

		if (theMap.get(ret_a).length() > 0 && !theMap.get(ret_a).equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(theMap.get(ret_a).substring(1, theMap.get(ret_a).length()-1).split(",")));
			for (j = 0; j < lookingAt.size(); j++) {
				if(lookingAt.get(j).equals("class"))
					lookingAt.remove(j);
			}
			theMap.put(ret_a, al_ts_a(lookingAt));
		}

	}

	boolean isSubtypeL0(Signature o) {
		boolean retv = theMap.get(pkg).equals(o.theMap.get(pkg)) && theMap.get(fun).equals(o.theMap.get(fun)) &&
									 isSubtypeL0(theMap.get(ret_t), o.theMap.get(ret_t));

		if (!retv) {
			return retv;
		}

		for (int i = arg1_t; i <= arg20_t; i ++) {
			retv = retv && isSubtypeL0(theMap.get(i), o.theMap.get(i));
			if (!retv)
				return retv;
		}

		return retv;
	}

	boolean isSubtypeL1(Signature o) {
		boolean retv = theMap.get(pkg).equals(o.theMap.get(pkg)) && theMap.get(fun).equals(o.theMap.get(fun)) &&
									 isSubtypeL1(theMap.get(ret_t), o.theMap.get(ret_t));

		if (!retv) {
			return retv;
		}

		for (int i = arg1_t; i <= arg20_t; i ++) {
			retv = retv && isSubtypeL1(theMap.get(i), o.theMap.get(i));
			if (!retv)
				return retv;
		}

		return retv;
	}

	boolean isSubtypeL2(Signature o) {
		boolean retv = theMap.get(pkg).equals(o.theMap.get(pkg)) && theMap.get(fun).equals(o.theMap.get(fun)) &&
									 isSubtypeL2_c(theMap.get(ret_c), o.theMap.get(ret_c)) &&
									 isSubtypeL2_a(theMap.get(ret_a), o.theMap.get(ret_a)) && this.isSubtypeL1(o);

	  if (!retv) {
 			return retv;
 		}

 		for (int i = arg1_c; i <= arg20_c; i ++) {
 			retv = retv && isSubtypeL2_c(theMap.get(i), o.theMap.get(i));
 			if (!retv)
 				return retv;
 		}

		for (int i = arg1_a; i <= arg20_a; i ++) {
 			retv = retv && isSubtypeL2_a(theMap.get(i), o.theMap.get(i));
 			if (!retv)
 				return retv;
 		}

		return retv;


	}

	static String simplifyType(String aT) {
		if (aT.equals("vector/double"))
			return "D";
		else if (aT.equals("matrix/double"))
			return "M{D}";
		else if (aT.equals("scalar/double"))
			return "sD";
		else if (aT.equals("vector/integer"))
			return "I";
		else if (aT.equals("matrix/integer"))
			return "M{I}";
		else if (aT.equals("scalar/integer"))
			return "sI";
		else if (aT.equals("vector/character"))
			return "C";
		else if (aT.equals("matrix/character"))
			return "M{C}";
		else if (aT.equals("scalar/character"))
			return "sC";
		else if (aT.equals("vector/logical"))
			return "L";
		else if (aT.equals("matrix/logical"))
			return "M{L}";
		else if (aT.equals("scalar/logical"))
			return "sL";
		else if (aT.equals("vector/raw"))
			return "R";
		else if (aT.equals("matrix/raw"))
			return "M{R}";
		else if (aT.equals("scalar/raw"))
			return "sR";
		else if (aT.equals("vector/complex"))
			return "X";
		else if (aT.equals("matrix/complex"))
			return "M{X}";
		else if (aT.equals("scalar/complex"))
			return "sX";
		else if (aT.equals("symbol"))
			return "Y";
		else if (aT.equals("S4"))
			return "sS";
		else if (aT.equals("closure"))
			return "sF";
		else if (aT.equals("builtin"))
			return "sF";
		else if (aT.equals("special"))
			return "sF";
		else if (aT.equals("function"))
			return "sF";
		else if (aT.equals("environment"))
			return "sE";
		else if (aT.equals("NULL"))
			return "sN";
		else if (aT.equals("double"))
			return "D";
		else if (aT.equals("raw_NA"))
			return "sN";
		else if (aT.equals("integer"))
			return "I";
		else if (aT.equals("logical"))
			return "L";
		else if (aT.equals("raw"))
			return "R";
		else if (aT.equals("complex"))
			return "X";
		else if (aT.equals("character"))
			return "C";
		else if (aT.equals("list"))
			return "l{?}";
		else if (aT.equals("any"))
			return "?";
		else if (aT.length() > 5 && aT.substring(0, 5).equals("list<"))
			return "l{" + simplifyType(aT.substring(5, aT.length()-1)) + "}";
		else
			return aT;
	}

	public void write(Writer w) {
		for (int i = 1; i <= ret_a; i ++) {
			w.toS(theMap.get(i));
			if (i != ret_a)
				w.comma();
		}
		w.nl();
	}

	static Signature read(Reader r) {
		Signature f = new Signature();
		f.theMap.put(filename, r.filename); // debugging

		f.theMap.put(pkg, r.getS());
		f.theMap.put(fun, r.getS());
		f.theMap.put(has_dots, r.getS());

		if (!simplify) {
			for (int i = arg1_t; i <= arg20_t; i ++) {
				f.theMap.put(i, r.getS());
			}
		} else {
			for (int i = arg1_t; i <= arg20_t; i ++) {
				f.theMap.put(i, simplifyType(r.getS()));
			}
		}

		for (int i = arg1_c; i <= arg20_a; i ++) {
			f.theMap.put(i, r.getS());
		}

		if (! simplify)
			f.theMap.put(ret_t, r.getS());
		else
			f.theMap.put(ret_t, simplifyType(r.getS()));

		f.theMap.put(ret_c, r.getS());
		f.theMap.put(ret_a, r.getS());
		return f;
	}

	public boolean isNA(int v) {
		return v == Integer.MIN_VALUE;
	}

	public boolean isNA(short v) {
		return v == Short.MIN_VALUE;
	}

	boolean e(String s, Reader r) {
		r.badData(s);
		return false;
	}

	@Override
	public String toString() {
		Writer w = new Writer(true);
		write(w);
		return w.toString() + " in " + filename;
	}
}
