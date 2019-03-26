library(etable)


### Name: tabular.ade
### Title: Tabular representation of any statistics.
### Aliases: tabular.ade
### Keywords: table

### ** Examples

# 1) simple own FUN cell function.
s_mean<- function(x, y, z, w, cell_ids, row_ids, col_ids, vnames, vars, n_min, ds=3){
out<- ''
if(length(cell_ids)>= n_min){
out<-  format(mean(x[cell_ids], na.rm=TRUE), digits=ds)
}
return(out)
}
##########################################
# 2) simple 2 x 2 table of means
sex   <- factor(rbinom(5000, 1, 0.5), labels=c('Men', 'Women'))
age   <- round(runif(5000, 18, 89))
treat <- factor(rbinom(5000, 1, 0.3), labels=c('control', 'treated'))
d<-data.frame(sex, age, treat)
tabular.ade(x_vars='age', xname='Age [y]', rows='sex', rnames='Sex', cols='treat',
cnames='Treatment', data=d, nonames=FALSE, FUN=s_mean)
##########################################
# 3) Relative frequency table
d$dosis <- round(runif(5000, 0.5, 6.49))
tabular.ade(x_vars='age', xname='Age [y]', rows=c('sex', 'treat'),
rnames=c('Sex', 'Treatment'), cols='dosis', cnames='Dosis', data=d, FUN=n_cell,
type='pct')
##########################################
# 4) Weighted median table
d$w <- runif(5000, 0.1, 5)
d$bmi <- rnorm(5000, 30, 3)
tabular.ade(x_vars=c('age', 'bmi'), xname=c('Age', 'BMI'),
cols=c('sex', 'ALL', 'treat'),
cnames=c('Sex', 'Treatment'), w='w', data=d, FUN=quantile_cell)
##########################################
# 5) Correlation table between age and bmi
tabular.ade(x_vars='age', xname='Age', y_vars='bmi', yname='BMI',
rows=c('dosis'), rnames=c('Dosis'), cols=c('sex', 'treat'),
cnames=c('Sex', 'Treatment'), data=d, FUN=corr_p_cell)
##########################################
# 6) Multiple statistics
tabular.ade(x_vars=c('N', 'MEAN', 'SD', 'SKEW', 'KURT', 'RANGE'),
y_vars=c('age', 'bmi'), yname=c('Age', 'BMI'),
cols=c('sex', 'ALL', 'treat'), cnames=c('Sex', 'Treatment'),
w='w', data=d, FUN=stat_cell)



