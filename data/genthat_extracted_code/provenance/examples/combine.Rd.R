library(provenance)


### Name: combine
### Title: Combine samples of distributional data
### Aliases: combine

### ** Examples

data(Namib)
combined <- combine(Namib$DZ,
                    east=c('N3','N4','N5','N6','N7','N8','N9','N10'),
                    west=c('N1','N2','N11','N12','T8','T13'))
summaryplot(KDEs(combined))



