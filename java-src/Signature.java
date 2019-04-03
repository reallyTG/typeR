
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
	String pkg;
	String fun;
	boolean has_dots;
	String arg1_t;
	String arg2_t;;
	String arg3_t;
	String arg4_t;
	String arg5_t;
	String arg6_t;
	String arg7_t;
	String arg8_t;
	String arg9_t;
	String arg10_t;
	String arg11_t;
	String arg12_t;
	String arg13_t;
	String arg14_t;
	String arg15_t;
	String arg16_t;
	String arg17_t;
	String arg18_t;
	String arg19_t;
	String arg20_t;
	String arg1_c;
	String arg2_c;
	String arg3_c;
	String arg4_c;
	String arg5_c;
	String arg6_c;
	String arg7_c;
	String arg8_c;
	String arg9_c;
	String arg10_c;
	String arg11_c;
	String arg12_c;
	String arg13_c;
	String arg14_c;
	String arg15_c;
	String arg16_c;
	String arg17_c;
	String arg18_c;
	String arg19_c;
	String arg20_c;
	String arg1_a;
	String arg2_a;
	String arg3_a;
	String arg4_a;
	String arg5_a;
	String arg6_a;
	String arg7_a;
	String arg8_a;
	String arg9_a;
	String arg10_a;
	String arg11_a;
	String arg12_a;
	String arg13_a;
	String arg14_a;
	String arg15_a;
	String arg16_a;
	String arg17_a;
	String arg18_a;
	String arg19_a;
	String arg20_a;
	String ret_t;
	String ret_c;
	String ret_a;

	boolean isSubtypeL0(String a, String b) {
		if (b.equals("any"))
			return true;
		if (a.equals("logical") && b.equals("integer"))
			return true;
		if (a.equals("logical") && b.equals("double"))
			return true;
		if (a.equals("integer") && b.equals("double"))
			return true;
		if (a.equals("unevaled"))
			return true;
		if (a.equals("missing"))
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
		f.ret_t = r.getS();
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