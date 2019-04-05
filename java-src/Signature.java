import java.util.Set;
import java.util.HashSet;
import java.util.Arrays;
import java.util.ArrayList;

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
	public String filename;
	public String pkg;
	public String fun;
	public boolean has_dots;
	public String arg1_t;
	public String arg2_t;
	public String arg3_t;
	public String arg4_t;
	public String arg5_t;
	public String arg6_t;
	public String arg7_t;
	public String arg8_t;
	public String arg9_t;
	public String arg10_t;
	public String arg11_t;
	public String arg12_t;
	public String arg13_t;
	public String arg14_t;
	public String arg15_t;
	public String arg16_t;
	public String arg17_t;
	public String arg18_t;
	public String arg19_t;
	public String arg20_t;
	public String arg1_c;
	public String arg2_c;
	public String arg3_c;
	public String arg4_c;
	public String arg5_c;
	public String arg6_c;
	public String arg7_c;
	public String arg8_c;
	public String arg9_c;
	public String arg10_c;
	public String arg11_c;
	public String arg12_c;
	public String arg13_c;
	public String arg14_c;
	public String arg15_c;
	public String arg16_c;
	public String arg17_c;
	public String arg18_c;
	public String arg19_c;
	public String arg20_c;
	public String arg1_a;
	public String arg2_a;
	public String arg3_a;
	public String arg4_a;
	public String arg5_a;
	public String arg6_a;
	public String arg7_a;
	public String arg8_a;
	public String arg9_a;
	public String arg10_a;
	public String arg11_a;
	public String arg12_a;
	public String arg13_a;
	public String arg14_a;
	public String arg15_a;
	public String arg16_a;
	public String arg17_a;
	public String arg18_a;
	public String arg19_a;
	public String arg20_a;
	public String ret_t;
	public String ret_c;
	public String ret_a;

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
		return a.equals(b);
	}

	// if ((a.equals("sL") || a.equals("L")) && (b.equals("sD") || b.equals("D")))			// logical <: double
	// 	return true;
	// if ((a.equals("sL") || a.equals("L")) && (b.equals("sI") || b.equals("I")))			// logical <: integer
	// 	return true;
	// if ((a.equals("sI") || a.equals("I")) && (b.equals("sD") || b.equals("D"))) 		// integer <: double
	// 	return true;

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
		if (a.equals("L") && b.equals("D"))			// logical <: double
			return true;
		if (a.equals("sL") && b.equals("sI"))			// logical <: int
			return true;
		if (a.equals("L") && b.equals("I"))			// logical <: int
			return true;
		if (a.equals("sI") && b.equals("sD"))			// int <: double
			return true;
		if (a.equals("I") && b.equals("D"))			// int <: double
			return true;
		if (a.equals("unevaled"))																					// unevaled <: T
			return true;
		if (a.equals("missing"))																					// missing <: T
			return true;
		if (a.equals("sN"))																							// null <: T
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
		int i;
		ArrayList<String> lookingAt;

		// sanitize classes -- removing all primitive ones

		if (!arg1_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg1_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg1_c = al_ts(lookingAt);
		}

		if (!arg2_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg2_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg2_c = al_ts(lookingAt);
		}

		if (!arg3_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg3_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg3_c = al_ts(lookingAt);
		}

		if (!arg4_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg4_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg4_c = al_ts(lookingAt);
		}

		if (!arg5_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg5_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg5_c = al_ts(lookingAt);
		}

		if (!arg6_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg6_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg6_c = al_ts(lookingAt);
		}

		if (!arg7_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg7_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg7_c = al_ts(lookingAt);
		}

		if (!arg8_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg8_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg8_c = al_ts(lookingAt);
		}

		if (!arg9_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg9_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg9_c = al_ts(lookingAt);
		}

		if (!arg10_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg10_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg10_c = al_ts(lookingAt);
		}

		if (!arg11_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg11_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg11_c = al_ts(lookingAt);
		}

		if (!arg12_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg12_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg12_c = al_ts(lookingAt);
		}

		if (!arg13_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg13_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg13_c = al_ts(lookingAt);
		}

		if (!arg14_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg14_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg14_c = al_ts(lookingAt);
		}

		if (!arg15_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg15_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg15_c = al_ts(lookingAt);
		}

		if (!arg16_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg16_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg16_c = al_ts(lookingAt);
		}

		if (!arg17_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg17_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg17_c = al_ts(lookingAt);
		}

		if (!arg18_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg18_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg18_c = al_ts(lookingAt);
		}

		if (!arg19_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg19_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg19_c = al_ts(lookingAt);
		}

		if (!arg20_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg20_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			arg20_c = al_ts(lookingAt);
		}

		if (!ret_c.equals("")) {
			lookingAt = new ArrayList<String>(Arrays.asList(ret_c.split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(primitiveClassesSet.contains(lookingAt.get(i)))
					lookingAt.remove(i);
			}
			ret_c = al_ts(lookingAt);
		}

		// sanitize attributes -- remove class, as if it's important it'll be in
		//
		//

		if (arg1_a.length() > 0 && !arg1_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg1_a.substring(1, arg1_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg1_a = al_ts_a(lookingAt);
		}

		if (arg2_a.length() > 0 && !arg2_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg2_a.substring(1, arg2_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg2_a = al_ts_a(lookingAt);
		}

		if (arg3_a.length() > 0 && !arg3_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg3_a.substring(1, arg3_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg3_a = al_ts_a(lookingAt);
		}

		if (arg4_a.length() > 0 && !arg4_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg4_a.substring(1, arg4_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg4_a = al_ts_a(lookingAt);
		}

		if (arg5_a.length() > 0 && !arg5_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg5_a.substring(1, arg5_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg5_a = al_ts_a(lookingAt);
		}

		if (arg6_a.length() > 0 && !arg6_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg6_a.substring(1, arg6_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg6_a = al_ts_a(lookingAt);
		}

		if (arg7_a.length() > 0 && !arg7_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg7_a.substring(1, arg7_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg7_a = al_ts_a(lookingAt);
		}

		if (arg8_a.length() > 0 && !arg8_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg8_a.substring(1, arg8_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg8_a = al_ts_a(lookingAt);
		}

		if (arg9_a.length() > 0 && !arg9_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg9_a.substring(1, arg9_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg9_a = al_ts_a(lookingAt);
		}

		if (arg10_a.length() > 0 && !arg10_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg10_a.substring(1, arg10_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg10_a = al_ts_a(lookingAt);
		}

		if (arg11_a.length() > 0 && !arg11_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg11_a.substring(1, arg11_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg11_a = al_ts_a(lookingAt);
		}

		if (arg12_a.length() > 0 && !arg12_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg12_a.substring(1, arg12_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg12_a = al_ts_a(lookingAt);
		}

		if (arg13_a.length() > 0 && !arg13_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg13_a.substring(1, arg13_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg13_a = al_ts_a(lookingAt);
		}

		if (arg14_a.length() > 0 && !arg14_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg14_a.substring(1, arg14_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg14_a = al_ts_a(lookingAt);
		}

		if (arg15_a.length() > 0 && !arg15_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg15_a.substring(1, arg15_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg15_a = al_ts_a(lookingAt);
		}

		if (arg16_a.length() > 0 && !arg16_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg16_a.substring(1, arg16_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg16_a = al_ts_a(lookingAt);
		}

		if (arg17_a.length() > 0 && !arg17_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg17_a.substring(1, arg17_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg17_a = al_ts_a(lookingAt);
		}

		if (arg18_a.length() > 0 && !arg18_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg18_a.substring(1, arg18_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg18_a = al_ts_a(lookingAt);
		}

		if (arg19_a.length() > 0 && !arg19_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg19_a.substring(1, arg19_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg19_a = al_ts_a(lookingAt);
		}

		if (arg20_a.length() > 0 && !arg20_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(arg20_a.substring(1, arg20_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			arg20_a = al_ts_a(lookingAt);
		}

		if (ret_a.length() > 0 && !ret_a.equals("{}")) {
			lookingAt = new ArrayList<String>(Arrays.asList(ret_a.substring(1, ret_a.length()-1).split(",")));
			for (i = 0; i < lookingAt.size(); i++) {
				if(lookingAt.get(i).equals("class"))
					lookingAt.remove(i);
			}
			ret_a = al_ts_a(lookingAt);
		}

	}

	boolean isSubtypeL0(Signature o) {
		return pkg.equals(o.pkg) && fun.equals(o.fun) && isSubtypeL0(arg1_t, o.arg1_t) && isSubtypeL0(arg2_t, o.arg2_t)
				&& isSubtypeL0(arg3_t, o.arg3_t) && isSubtypeL0(arg4_t, o.arg4_t) && isSubtypeL0(arg5_t, o.arg5_t)
				&& isSubtypeL0(arg6_t, o.arg6_t) && isSubtypeL0(arg7_t, o.arg7_t) && isSubtypeL0(arg8_t, o.arg8_t)
				&& isSubtypeL0(arg9_t, o.arg9_t) && isSubtypeL0(arg10_t, o.arg10_t) && isSubtypeL0(arg11_t, o.arg11_t)
				&& isSubtypeL0(arg12_t, o.arg12_t) && isSubtypeL0(arg13_t, o.arg13_t) && isSubtypeL0(arg14_t, o.arg14_t)
				&& isSubtypeL0(arg15_t, o.arg15_t) && isSubtypeL0(arg16_t, o.arg16_t) && isSubtypeL0(arg17_t, o.arg17_t)
				&& isSubtypeL0(arg18_t, o.arg18_t) && isSubtypeL0(arg19_t, o.arg19_t)
				&& isSubtypeL0(arg20_t, o.arg20_t) && isSubtypeL0(ret_t, o.ret_t);
	}

	boolean isSubtypeL1(Signature o) {
		return pkg.equals(o.pkg) && fun.equals(o.fun) && isSubtypeL1(arg1_t, o.arg1_t) && isSubtypeL1(arg2_t, o.arg2_t)
				&& isSubtypeL1(arg3_t, o.arg3_t) && isSubtypeL1(arg4_t, o.arg4_t) && isSubtypeL1(arg5_t, o.arg5_t)
				&& isSubtypeL1(arg6_t, o.arg6_t) && isSubtypeL1(arg7_t, o.arg7_t) && isSubtypeL1(arg8_t, o.arg8_t)
				&& isSubtypeL1(arg9_t, o.arg9_t) && isSubtypeL1(arg10_t, o.arg10_t) && isSubtypeL1(arg11_t, o.arg11_t)
				&& isSubtypeL1(arg12_t, o.arg12_t) && isSubtypeL1(arg13_t, o.arg13_t) && isSubtypeL1(arg14_t, o.arg14_t)
				&& isSubtypeL1(arg15_t, o.arg15_t) && isSubtypeL1(arg16_t, o.arg16_t) && isSubtypeL1(arg17_t, o.arg17_t)
				&& isSubtypeL1(arg18_t, o.arg18_t) && isSubtypeL1(arg19_t, o.arg19_t)
				&& isSubtypeL1(arg20_t, o.arg20_t) && isSubtypeL1(ret_t, o.ret_t);
	}

	boolean isSubtypeL2(Signature o) {
		return this.isSubtypeL1(o) && pkg.equals(o.pkg) && fun.equals(o.fun) && isSubtypeL2_a(arg1_a, o.arg1_a) && isSubtypeL2_a(arg2_a, o.arg2_a)
				&& isSubtypeL2_a(arg3_a, o.arg3_a) && isSubtypeL2_a(arg4_a, o.arg4_a) && isSubtypeL2_a(arg5_a, o.arg5_a)
				&& isSubtypeL2_a(arg6_a, o.arg6_a) && isSubtypeL2_a(arg7_a, o.arg7_a) && isSubtypeL2_a(arg8_a, o.arg8_a)
				&& isSubtypeL2_a(arg9_a, o.arg9_a) && isSubtypeL2_a(arg10_a, o.arg10_a) && isSubtypeL2_a(arg11_a, o.arg11_a)
				&& isSubtypeL2_a(arg12_a, o.arg12_a) && isSubtypeL2_a(arg13_a, o.arg13_a) && isSubtypeL2_a(arg14_a, o.arg14_a)
				&& isSubtypeL2_a(arg15_a, o.arg15_a) && isSubtypeL2_a(arg16_a, o.arg16_a) && isSubtypeL2_a(arg17_a, o.arg17_a)
				&& isSubtypeL2_a(arg18_a, o.arg18_a) && isSubtypeL2_a(arg19_a, o.arg19_a)
				&& isSubtypeL2_a(arg20_a, o.arg20_a) && isSubtypeL2_a(ret_a, o.ret_a) && isSubtypeL2_c(arg1_c, o.arg1_c) && isSubtypeL2_c(arg2_c, o.arg2_c)
				&& isSubtypeL2_c(arg3_c, o.arg3_c) && isSubtypeL2_c(arg4_c, o.arg4_c) && isSubtypeL2_c(arg5_c, o.arg5_c)
				&& isSubtypeL2_c(arg6_c, o.arg6_c) && isSubtypeL2_c(arg7_c, o.arg7_c) && isSubtypeL2_c(arg8_c, o.arg8_c)
				&& isSubtypeL2_c(arg9_c, o.arg9_c) && isSubtypeL2_c(arg10_c, o.arg10_c) && isSubtypeL2_c(arg11_c, o.arg11_c)
				&& isSubtypeL2_c(arg12_c, o.arg12_c) && isSubtypeL2_c(arg13_c, o.arg13_c) && isSubtypeL2_c(arg14_c, o.arg14_c)
				&& isSubtypeL2_c(arg15_c, o.arg15_c) && isSubtypeL2_c(arg16_c, o.arg16_c) && isSubtypeL2_c(arg17_c, o.arg17_c)
				&& isSubtypeL2_c(arg18_c, o.arg18_c) && isSubtypeL2_c(arg19_c, o.arg19_c)
				&& isSubtypeL2_c(arg20_c, o.arg20_c) && isSubtypeL2_c(ret_c, o.ret_c);
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

  // how to do this...
	// boolean isSubtypeL2(Signature o) {
	// 	return pkg.equals(o.pkg) && fun.equals(o.fun) && isSubtypeL2
	//
	// 	    // ... isSubtypeL1(arg1_t, o.arg1_t) && isSubtypeL1(arg2_t, o.arg2_t)
	// 			// && isSubtypeL1(arg3_t, o.arg3_t) && isSubtypeL1(arg4_t, o.arg4_t) && isSubtypeL1(arg5_t, o.arg5_t)
	// 			// && isSubtypeL1(arg6_t, o.arg6_t) && isSubtypeL1(arg7_t, o.arg7_t) && isSubtypeL1(arg8_t, o.arg8_t)
	// 			// && isSubtypeL1(arg9_t, o.arg9_t) && isSubtypeL1(arg10_t, o.arg10_t) && isSubtypeL1(arg11_t, o.arg11_t)
	// 			// && isSubtypeL1(arg12_t, o.arg12_t) && isSubtypeL1(arg13_t, o.arg13_t) && isSubtypeL1(arg14_t, o.arg14_t)
	// 			// && isSubtypeL1(arg15_t, o.arg15_t) && isSubtypeL1(arg16_t, o.arg16_t) && isSubtypeL1(arg17_t, o.arg17_t)
	// 			// && isSubtypeL1(arg18_t, o.arg18_t) && isSubtypeL1(arg19_t, o.arg19_t)
	// 			// && isSubtypeL1(arg20_t, o.arg20_t);
	// }

	public void write(Writer w) {
		w.toS(pkg);
		w.comma();
		w.toS(fun);
		w.comma();
		w.toI(has_dots ? 1 : 0);
		w.comma();
		w.toS(arg1_t);
		w.comma();
		w.toS(arg2_t);
		w.comma();
		w.toS(arg3_t);
		w.comma();
		w.toS(arg4_t);
		w.comma();
		w.toS(arg5_t);
		w.comma();
		w.toS(arg6_t);
		w.comma();
		w.toS(arg7_t);
		w.comma();
		w.toS(arg8_t);
		w.comma();
		w.toS(arg9_t);
		w.comma();
		w.toS(arg10_t);
		w.comma();
		w.toS(arg11_t);
		w.comma();
		w.toS(arg12_t);
		w.comma();
		w.toS(arg13_t);
		w.comma();
		w.toS(arg14_t);
		w.comma();
		w.toS(arg15_t);
		w.comma();
		w.toS(arg16_t);
		w.comma();
		w.toS(arg17_t);
		w.comma();
		w.toS(arg18_t);
		w.comma();
		w.toS(arg19_t);
		w.comma();
		w.toS(arg20_t);
		w.comma();
		w.toS(arg1_c);
		w.comma();
		w.toS(arg2_c);
		w.comma();
		w.toS(arg3_c);
		w.comma();
		w.toS(arg4_c);
		w.comma();
		w.toS(arg5_c);
		w.comma();
		w.toS(arg6_c);
		w.comma();
		w.toS(arg7_c);
		w.comma();
		w.toS(arg8_c);
		w.comma();
		w.toS(arg9_c);
		w.comma();
		w.toS(arg10_c);
		w.comma();
		w.toS(arg11_c);
		w.comma();
		w.toS(arg12_c);
		w.comma();
		w.toS(arg13_c);
		w.comma();
		w.toS(arg14_c);
		w.comma();
		w.toS(arg15_c);
		w.comma();
		w.toS(arg16_c);
		w.comma();
		w.toS(arg17_c);
		w.comma();
		w.toS(arg18_c);
		w.comma();
		w.toS(arg19_c);
		w.comma();
		w.toS(arg20_c);
		w.comma();
		w.toS(arg1_a);
		w.comma();
		w.toS(arg2_a);
		w.comma();
		w.toS(arg3_a);
		w.comma();
		w.toS(arg4_a);
		w.comma();
		w.toS(arg5_a);
		w.comma();
		w.toS(arg6_a);
		w.comma();
		w.toS(arg7_a);
		w.comma();
		w.toS(arg8_a);
		w.comma();
		w.toS(arg9_a);
		w.comma();
		w.toS(arg10_a);
		w.comma();
		w.toS(arg11_a);
		w.comma();
		w.toS(arg12_a);
		w.comma();
		w.toS(arg13_a);
		w.comma();
		w.toS(arg14_a);
		w.comma();
		w.toS(arg15_a);
		w.comma();
		w.toS(arg16_a);
		w.comma();
		w.toS(arg17_a);
		w.comma();
		w.toS(arg18_a);
		w.comma();
		w.toS(arg19_a);
		w.comma();
		w.toS(arg20_a);
		w.comma();
		if (simplify)
			w.toS(simplifyType(ret_t));
		else
			w.toS(ret_t);
		w.comma();
		w.toS(ret_c);
		w.comma();
		w.toS(ret_a);
		w.nl();
	}

	static Signature read(Reader r) {
		Signature f = new Signature();
		f.filename = r.filename; // for debugging purposes

		f.pkg = r.getS();
		f.fun = r.getS();
		f.has_dots = r.getS().equals("TRUE");
		if (!simplify) {
			f.arg1_t = r.getS();
			f.arg2_t = r.getS();
			f.arg3_t = r.getS();
			f.arg4_t = r.getS();
			f.arg5_t = r.getS();
			f.arg6_t = r.getS();
			f.arg7_t = r.getS();
			f.arg8_t = r.getS();
			f.arg9_t = r.getS();
			f.arg10_t = r.getS();
			f.arg11_t = r.getS();
			f.arg12_t = r.getS();
			f.arg13_t = r.getS();
			f.arg14_t = r.getS();
			f.arg15_t = r.getS();
			f.arg16_t = r.getS();
			f.arg17_t = r.getS();
			f.arg18_t = r.getS();
			f.arg19_t = r.getS();
			f.arg20_t = r.getS();
		} else {
			f.arg1_t = simplifyType(r.getS());
			f.arg2_t = simplifyType(r.getS());
			f.arg3_t = simplifyType(r.getS());
			f.arg4_t = simplifyType(r.getS());
			f.arg5_t = simplifyType(r.getS());
			f.arg6_t = simplifyType(r.getS());
			f.arg7_t = simplifyType(r.getS());
			f.arg8_t = simplifyType(r.getS());
			f.arg9_t = simplifyType(r.getS());
			f.arg10_t = simplifyType(r.getS());
			f.arg11_t = simplifyType(r.getS());
			f.arg12_t = simplifyType(r.getS());
			f.arg13_t = simplifyType(r.getS());
			f.arg14_t = simplifyType(r.getS());
			f.arg15_t = simplifyType(r.getS());
			f.arg16_t = simplifyType(r.getS());
			f.arg17_t = simplifyType(r.getS());
			f.arg18_t = simplifyType(r.getS());
			f.arg19_t = simplifyType(r.getS());
			f.arg20_t = simplifyType(r.getS());
		}
		f.arg1_c = r.getS();
		f.arg2_c = r.getS();
		f.arg3_c = r.getS();
		f.arg4_c = r.getS();
		f.arg5_c = r.getS();
		f.arg6_c = r.getS();
		f.arg7_c = r.getS();
		f.arg8_c = r.getS();
		f.arg9_c = r.getS();
		f.arg10_c = r.getS();
		f.arg11_c = r.getS();
		f.arg12_c = r.getS();
		f.arg13_c = r.getS();
		f.arg14_c = r.getS();
		f.arg15_c = r.getS();
		f.arg16_c = r.getS();
		f.arg17_c = r.getS();
		f.arg18_c = r.getS();
		f.arg19_c = r.getS();
		f.arg20_c = r.getS();
		f.arg1_a = r.getS();
		f.arg2_a = r.getS();
		f.arg3_a = r.getS();
		f.arg4_a = r.getS();
		f.arg5_a = r.getS();
		f.arg6_a = r.getS();
		f.arg7_a = r.getS();
		f.arg8_a = r.getS();
		f.arg9_a = r.getS();
		f.arg10_a = r.getS();
		f.arg11_a = r.getS();
		f.arg12_a = r.getS();
		f.arg13_a = r.getS();
		f.arg14_a = r.getS();
		f.arg15_a = r.getS();
		f.arg16_a = r.getS();
		f.arg17_a = r.getS();
		f.arg18_a = r.getS();
		f.arg19_a = r.getS();
		f.arg20_a = r.getS();
		if (! simplify)
			f.ret_t = r.getS();
		else
			f.ret_t = simplifyType(r.getS());
		f.ret_c = r.getS();
		f.ret_a = r.getS();
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
