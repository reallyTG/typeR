library(TmCalculator)


### Name: Tm_Wallace
### Title: Calculate the melting temperature using the 'Wallace rule'
### Aliases: Tm_Wallace

### ** Examples

ntseq = c('acgtTGCAATGCCGTAWSDBSY') #for wallace rule
Tm_Wallace(ntseq,ambiguous = TRUE)
Tm_Wallace(ntseq,ambiguous = FALSE)



