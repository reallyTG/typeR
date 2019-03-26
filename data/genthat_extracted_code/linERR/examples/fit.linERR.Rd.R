library(linERR)


### Name: fit.linERR
### Title: Fits linear ERR model
### Aliases: fit.linERR
### Keywords: linERR models regression survival

### ** Examples

  data(cohort1) 
  fit.1 <- fit.linERR(Surv(entryage, exitage, leu)~sex|dose1+dose2+dose3+dose4+dose5+dose6+
                      dose7+dose8+dose9+dose10+dose11+dose12+dose13+dose14+dose15+dose16+
                      dose17+dose18+dose19+dose20+dose21+dose22+dose23+dose24+dose25+dose26+
                      dose27+dose28+dose29+dose30+dose31+dose32, data=cohort1, beta=NULL, 
                      ages=cohort1[, 7:38], lag=2)



