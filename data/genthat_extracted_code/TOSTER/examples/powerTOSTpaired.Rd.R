library(TOSTER)


### Name: powerTOSTpaired
### Title: Power analysis for TOST for dependent t-test (Cohen's dz).
### Aliases: powerTOSTpaired

### ** Examples

## Sample size for alpha = 0.05, 80% power, equivalence bounds of
## Cohen's dz = -0.3 and Cohen's d = 0.3, and assuming true effect = 0
powerTOSTpaired(alpha=0.05,statistical_power=0.8,low_eqbound_dz=-0.3,high_eqbound_dz=0.3)

## Sample size for alpha = 0.05, N = 96 pairs, equivalence bounds of
## Cohen's dz = -0.3 and Cohen's d = 0.3, and assuming true effect = 0
powerTOSTpaired(alpha=0.05,N=96,low_eqbound_dz=-0.3,high_eqbound_dz=0.3)

## Equivalence bounds for alpha = 0.05, N = 96 pairs, statistical power of
## 0.8, and assuming true effect = 0
powerTOSTpaired(alpha=0.05,N=96,statistical_power=0.8)



