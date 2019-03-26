library(RcmdrMisc)


### Name: colPercents
### Title: Row, Column, and Total Percentage Tables
### Aliases: colPercents rowPercents totPercents
### Keywords: misc

### ** Examples

if (require(car)){
    data(Mroz) # from car package
    cat("\n\n column percents:\n")
    print(colPercents(xtabs(~ lfp + wc, data=Mroz)))
    cat("\n\n row percents:\n")
    print(rowPercents(xtabs(~ hc + lfp, data=Mroz)))
    cat("\n\n total percents:\n")
    print(totPercents(xtabs(~ hc + wc, data=Mroz)))
    cat("\n\n three-way table, column percents:\n")
    print(colPercents(xtabs(~ lfp + wc + hc, data=Mroz)))
}



