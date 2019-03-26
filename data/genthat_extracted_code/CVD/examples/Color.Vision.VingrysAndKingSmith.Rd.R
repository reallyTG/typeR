library(CVD)


### Name: Color.Vision.VingrysAndKingSmith
### Title: Scoring the results of the "D-15", "D-15DS" or "FM1OO-Hue" tests
### Aliases: Color.Vision.VingrysAndKingSmith
### Keywords: programming

### ** Examples

Color.Vision.VingrysAndKingSmith(1:15,silent=FALSE)
#result from the original GW Basic version:
#SUMS OF U AND V              41.25999     -4.92
# ANGLE MAJ RAD MIN RAD TOT ERR S-INDEX C-INDEX
#    61.98     9.23     6.71    11.42     1.38     1.00
Color.Vision.VingrysAndKingSmith(1:15,'D-15DS',silent=FALSE)
#result from the original GW Basic version:
#SUMS OF U AND V              26.86001     -38.69
# ANGLE MAJ RAD MIN RAD TOT ERR S-INDEX C-INDEX
#    61.44     5.12     3.60     6.26     1.42     1.00
Color.Vision.VingrysAndKingSmith(1:85, 'FM1OO-Hue',silent=FALSE)
#result from the original GW Basic version:
#SUMS OF U AND V              423.7896      203.7294
# ANGLE MAJ RAD MIN RAD TOT ERR S-INDEX C-INDEX
#    54.15     2.53     1.97     3.20     1.28     1.00



