library(PowerTOST)


### Name: CVCL
### Title: Confidence limits of a CV for log-normal data
### Aliases: CVCL

### ** Examples

# upper one-sided 95% CL of a CV=0.3 
# from a study with df=22 (f.i. a 2x2 crossover with n=24)
# side="upper" is standard if not explicitly given
CVCL(0.3, df=22)
# should give:
# lower CL  upper CL 
#0.0000000 0.4075525 



