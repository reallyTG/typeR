library(cwhmisc)


### Name: formatFix
### Title: Format to a fixed format representation
### Aliases: formatFix
### Keywords: print

### ** Examples

## Not run: 
##D xxbig <- c(1.2e9,3.51e23,6.72e120,NaN); xx <- c(0.001,92,exp(1),1000*pi)
##D t(t(formatFix(c(-rev(xxbig),-rev(xx),0,NA,xx,xxbig),0,3) ))
##D #> [1] "    NaN" "-7e+120" " -4e+23" " -1e+09" "  -3142" "     -3" "    -92"
##D #> [8] "     -0" "      0" "     NA" "      0" "     92" "      3" "   3142"
##D #> [15] "  1e+09" "  4e+23" " 7e+120" "    NaN"
##D t(t(formatFix(c(-rev(xxbig),-rev(xx),0,NA,xx,xxbig),0,3,FALSE) ))
##D #> [1] "NaN" "***" "***" "***" "***" " -3" "-92" " -0" "  0" " NA" "  0" " 92"
##D #> [13] "  3" "***" "***" "***" "***" "NaN"
##D formatFix(c(-rev(xxbig),-rev(xx),0,NA,xx,xxbig),6,3)
##D #> [1] "         NaN" "  -6.72e+120" "   -3.51e+23" "    -1.2e+09" "-3141.592654"
##D #> [6] "   -2.718282" "  -92.000000" "   -0.001000" "    0.000000" "          NA"
##D #> [11] "    0.001000" "   92.000000" "    2.718282" " 3141.592654" "     1.2e+09"
##D #> [16] "    3.51e+23" "   6.72e+120" "         NaN"
##D formatFix(c(-rev(xxbig),-rev(xx),0,NA,xx,xxbig),6,3,FALSE)
##D #> [1] "       NaN" "-6.72e+120" " -3.51e+23" "  -1.2e+09" "**********"
##D #> [6] " -2.718282" "-92.000000" " -0.001000" "  0.000000" "        NA"
##D #> [11] "  0.001000" " 92.000000" "  2.718282" "**********" "   1.2e+09"
##D #> [16] "  3.51e+23" " 6.72e+120" "       NaN"
## End(Not run)



