library(lifecontingencies)


### Name: annuity
### Title: Annuity function
### Aliases: annuity

### ** Examples

# The present value of 5 payments of 1000 at one year interval that begins 
# now when the interest rate is 2.5% is
1000*annuity(i=0.05, n=5, type = "due")
#A man borrows a loan of 20,000 to purchase a car at
# a nominal annual rate of interest of 0.06. He will pay back the loan through monthly
#installments over 5 years, with the first installment to be made one month
#after the release of the loan. What is the monthly installment he needs to pay?
R=20000/annuity(i=0.06/12, n=5*12)



