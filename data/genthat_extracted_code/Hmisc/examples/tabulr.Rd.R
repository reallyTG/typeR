library(Hmisc)


### Name: tabulr
### Title: Interface to Tabular Function
### Aliases: tabulr table_trio table_N table_freq table_pc table_latexdefs
###   table_formatpct nFm
### Keywords: utilities interface

### ** Examples

## Not run: 
##D n <- 400
##D set.seed(1)
##D d <- data.frame(country=factor(sample(c('US','Canada','Mexico'), n, TRUE)),
##D                 sex=factor(sample(c('Female','Male'), n, TRUE)),
##D                 age=rnorm(n, 50, 10),
##D                 sbp=rnorm(n, 120, 8))
##D d <- upData(d,
##D             preghx=ifelse(sex=='Female', sample(c('No','Yes'), n, TRUE), NA),
##D             labels=c(sbp='Systolic BP', age='Age', preghx='Pregnancy History'),
##D             units=c(sbp='mmHg', age='years'))
##D contents(d)
##D require(tables)
##D invisible(booktabs())  # use booktabs LaTeX style for tabular
##D g <- function(x) {
##D   x <- x[!is.na(x)]
##D   if(length(x) == 0) return('')
##D   paste(latexNumeric(nFm(mean(x), 3, 1)),
##D         ' \hfill{\smaller[2](', length(x), ')}', sep='')
##D }
##D tab <- tabulr((age + Heading('Females')*(sex == 'Female')*sbp)*
##D               Heading()*g + (age + sbp)*Heading()*trio ~ 
##D               Heading()*country*Heading()*sex, data=d)
##D # Formula after interpretation by tabulr:
##D # (Heading('Age\hfill {\smaller[2] years}') * age + Heading("Females")
##D # * (sex == "Female") * Heading('Systolic BP {\smaller[2] mmHg}') * sbp)
##D # * Heading() * g + (age + sbp) * Heading() * table_trio ~ Heading()
##D # * country * Heading() * sex
##D cat('\begin{landscape}\n')
##D cat('\begin{minipage}{\textwidth}\n')
##D cat('\keytrio\n')
##D latex(tab)
##D cat('\end{minipage}\end{landscape}\n')
##D 
##D getHdata(pbc)
##D pbc <- upData(pbc, moveUnits=TRUE)
##D # Convert to character to prevent tabular from stratifying
##D for(x in c('sex', 'stage', 'spiders')) {
##D   pbc[[x]] <- as.character(pbc[[x]])
##D   label(pbc[[x]]) <- paste(toupper(substring(x, 1, 1)), substring(x, 2), sep='')
##D }
##D table_options(pn=TRUE, showfreq='all')
##D tab <- tabulr((bili + albumin + protime + age) *
##D               Heading()*trio +
##D               (sex + stage + spiders)*Heading()*freq ~ drug, data=pbc)
##D latex(tab)
## End(Not run)



