library(FinancialMath)


### Name: forward.prepaid
### Title: Prepaid Forward Contract
### Aliases: forward.prepaid
### Keywords: forward

### ** Examples

forward.prepaid(S=100,t=2,r=.04,position="short",div.structure="none")

forward.prepaid(S=100,t=2,r=.03,position="long",div.structure="discrete",
dividend=3,k=.02,df=2)

forward.prepaid(S=100,t=1,r=.05,position="long",div.structure="continuous",D=.06)


