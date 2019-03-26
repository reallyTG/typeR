library(orddom)


### Name: orddom_f
### Title: Ordinal Dominance Statistics: File output of statistics for
###   multiple comparisons
### Aliases: orddom_f
### Keywords: nonparametric robust htest

### ** Examples
## Not run: 
##D # Example: Experiment with experimental group "ex" and control group "con"
##D # Data sets:
##D ex_pre<-c(52,53,55,59,57)
##D con_pre<-c(51,56,54,60,56)
##D ex_post<-c(58,62,63,64,69)
##D con_post<-c(48,58,57,62,55)
##D # Two independent and two paired comparisons are possible
##D # These are to be written to a csv-file
##D # Alpha-level = 10##D 
##D orddom_f(con_pre,ex_pre,alpha=0.025,decimalpt=",",description="EXP 01: Between groups at time 01")   
##D # result delta=-.04
##D orddom_f(con_post,ex_post,alpha=0.025,decimalpt=",",description="EXP 01: Between groups at time 02") 
##D # result delta=.84
##D orddom_f(ex_pre,ex_post,alpha=0.025,paired=TRUE,decimalpt=",",description="EXP 01: Within exp 01 to 02") 
##D # result delta_b=.9
##D orddom_f(con_pre,con_post,alpha=0.025,paired=TRUE,decimalpt=",",description="EXP 01: Within con 01 to 02") 
##D # result delta_b=.2
##D file.show(file.path(getwd()),"orddom_csv.txt")
## End(Not run)


