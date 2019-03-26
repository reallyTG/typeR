library(PTXQC)


### Name: simplifyNames
### Title: Removes common substrings (infixes) in a set of strings.
### Aliases: simplifyNames

### ** Examples

#library(PTXQC)
simplifyNames(c('TK20130501_H2M1_010_IMU008_CISPLA_E3_R1.raw',
                'TK20130501_H2M1_026_IMU008_CISPLA_E7_R2.raw'), infix_iterations = 2)
# --> "TK.._010_I.._E3_R1.raw","TK.._026_I.._E7_R2.raw"

try(simplifyNames(c("bla", "foo"), min_LCS_length=5))
# --> error, since min_LCS_length must be >=6




