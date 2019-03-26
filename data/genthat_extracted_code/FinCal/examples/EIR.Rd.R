library(FinCal)


### Name: EIR
### Title: Equivalent/proportional Interest Rates
### Aliases: EIR

### ** Examples

# monthly interest rat equivalent to 5% compounded per year
EIR(r=0.05,n=1,p=12)

# monthly interest rat equivalent to 5% compounded per half year
EIR(r=0.05,n=2,p=12)

# monthly interest rat equivalent to 5% compounded per quarter
EIR(r=0.05,n=4,p=12)

# annual interest rate equivalent to 5% compounded per month
EIR(r=0.05,n=12,p=1)
# this is equivalent to
ear(r=0.05,m=12)

# quarter interest rate equivalent to 5% compounded per year
EIR(r=0.05,n=1,p=4)

# quarter interest rate equivalent to 5% compounded per month
EIR(r=0.05,n=12,p=4)

# monthly proportional interest rate which is equivalent to a simple annual interest
EIR(r=0.05,p=12,type='p')



