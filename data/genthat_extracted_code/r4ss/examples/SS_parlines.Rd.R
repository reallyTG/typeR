library(r4ss)


### Name: SS_parlines
### Title: Get parameter lines from Stock Synthesis control file
### Aliases: SS_parlines
### Keywords: data manip

### ** Examples


## Not run: 
##D x <- SS_parlines(ctlfile='Y:/ss/SSv3.03a/Simple/Control.SS_New')
##D head(x)
##D #       LO    HI     INIT PRIOR PR_type   SD PHASE              Label Line_num
##D # 42  0.05  0.15  0.10000  0.10       0  0.8    -3  NatM_p_1_Fem_GP_1       42
##D # 43  0.05  0.15  0.10000  0.10       0  0.8    -3  NatM_p_2_Fem_GP_1       43
##D # 44  1.00 45.00 32.28100 36.00       0 10.0     2 L_at_Amin_Fem_GP_1       44
##D # 45 40.00 90.00 71.34260 70.00       0 10.0     4 L_at_Amax_Fem_GP_1       45
##D # 46  0.05  0.25  0.15199  0.15       0  0.8     4 VonBert_K_Fem_GP_1       46
##D # 47  0.05  0.25  0.10000  0.10       0  0.8    -3  CV_young_Fem_GP_1       47
## End(Not run)




