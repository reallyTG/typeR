library(mvbutils)


### Name: noice
### Title: Prints a call object nicely
### Aliases: noice
### Keywords: misc

### ** Examples

# This is a bona fide function call from my own work
# normally it would be evaluated directly, and sys.call()
# would be used inside it to assign a 'call' attrib to the result
# but the call attrib then looks like a mess-o-rama
# The quote() wrapper is just used here to make the point
# It would be interesting if 'call' could cope with a 'source' or
# 'srcref' argument, and would "know" how to print itself, but that
# is a big ask
# BTW, the 72-char limit in Rd EXAMPLES and USAGE is a PITBA
monster <- quote( est_N(
    popcompo = fp1a_17,
    df_rs_as_at_l = NULL,
    df_rs_ls = NULL, # NB comments are allowed, but get chucked
    newstyle_data = data17b,
    use_alpha_hsp = TRUE,
    AMIN = 8, AMAX = 30,
    YMIN = 2002, YMAX = 2014,
    prior_mean_z_plusgroup = 0.386,
    prior_sd_z_plusgroup = 0.0268,
    LMIN = 150, LMAX = 200,
    logit_surv_form = ~ I( pmax( age, 19)- AMAX) - 1,
    log_nsa_y1_form = ~factor(sex),
    log_nys_a1_reqm_form = ~0,
    logit_tresid_form = ~sex * I(len - 170),
    log_selbase_form = ~ 0,
    log_daily_reprodm_form = ~ 0,
    vb_form = ~sex,
    log_vb_cv_Linf_form = ~1,
    log_rct_re_var_start = log( sqr( 0.41)),
    fix_CV_R = TRUE,
    RE_rct = TRUE,
    sel_is_by_sex = TRUE,
    ssreduce_l = 1,
    fec_bout_start_fit = start_of_bout,
    fec_rest_start_fit = start_of_rest,
    fec_ovwt_fit = bfec,
    lf_sel_model=lv10kk5fix,
    nu_lata = 12))
monster # yuk
noice( monster) # yum



