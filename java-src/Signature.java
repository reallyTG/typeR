
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

	boolean isSubtypeL0(Signature o) {
		return pkg.equals(o.pkg) && fun.equals(o.fun) && isSubtypeL0(arg1_t, o.arg1_t) && isSubtypeL0(arg2_t, o.arg2_t)
				&& isSubtypeL0(arg3_t, o.arg3_t) && isSubtypeL0(arg4_t, o.arg4_t) && isSubtypeL0(arg5_t, o.arg5_t)
				&& isSubtypeL0(arg6_t, o.arg6_t) && isSubtypeL0(arg7_t, o.arg7_t) && isSubtypeL0(arg8_t, o.arg8_t)
				&& isSubtypeL0(arg9_t, o.arg9_t) && isSubtypeL0(arg10_t, o.arg10_t) && isSubtypeL0(arg11_t, o.arg11_t)
				&& isSubtypeL0(arg12_t, o.arg12_t) && isSubtypeL0(arg13_t, o.arg13_t) && isSubtypeL0(arg14_t, o.arg14_t)
				&& isSubtypeL0(arg15_t, o.arg15_t) && isSubtypeL0(arg16_t, o.arg16_t) && isSubtypeL0(arg17_t, o.arg17_t)
				&& isSubtypeL0(arg18_t, o.arg18_t) && isSubtypeL0(arg19_t, o.arg19_t)
				&& isSubtypeL0(arg20_t, o.arg20_t);
	}

	boolean isSubtypeL1(Signature o) {
		return pkg.equals(o.pkg) && fun.equals(o.fun) && isSubtypeL1(arg1_t, o.arg1_t) && isSubtypeL1(arg2_t, o.arg2_t)
				&& isSubtypeL1(arg3_t, o.arg3_t) && isSubtypeL1(arg4_t, o.arg4_t) && isSubtypeL1(arg5_t, o.arg5_t)
				&& isSubtypeL1(arg6_t, o.arg6_t) && isSubtypeL1(arg7_t, o.arg7_t) && isSubtypeL1(arg8_t, o.arg8_t)
				&& isSubtypeL1(arg9_t, o.arg9_t) && isSubtypeL1(arg10_t, o.arg10_t) && isSubtypeL1(arg11_t, o.arg11_t)
				&& isSubtypeL1(arg12_t, o.arg12_t) && isSubtypeL1(arg13_t, o.arg13_t) && isSubtypeL1(arg14_t, o.arg14_t)
				&& isSubtypeL1(arg15_t, o.arg15_t) && isSubtypeL1(arg16_t, o.arg16_t) && isSubtypeL1(arg17_t, o.arg17_t)
				&& isSubtypeL1(arg18_t, o.arg18_t) && isSubtypeL1(arg19_t, o.arg19_t)
				&& isSubtypeL1(arg20_t, o.arg20_t);
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
