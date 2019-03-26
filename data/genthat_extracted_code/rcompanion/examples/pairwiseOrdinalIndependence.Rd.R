library(rcompanion)


### Name: pairwiseOrdinalIndependence
### Title: Pairwise tests of independence for tables with one ordered
###   nominal variable
### Aliases: pairwiseOrdinalIndependence

### ** Examples

### Independence test for table with one ordered variable
data(Breakfast)
require(coin)
chisq_test(Breakfast,
           scores = list("Breakfast" = c(-2, -1, 0, 1, 2)))
PT = pairwiseOrdinalIndependence(Breakfast, compare = "row")
PT
cldList(comparison = PT$Comparison, 
        p.value    = PT$p.value, 
        threshold  = 0.05)
        
### Similar to Kruskal-Wallis test for Likert data
data(PoohPiglet)
XT = xtabs(~ Speaker + Likert, data = PoohPiglet)
XT
require(coin)
chisq_test(XT,
           scores = list("Likert" = c(1, 2, 3, 4, 5)))
PT=pairwiseOrdinalIndependence(XT, compare = "row")
PT
cldList(comparison = PT$Comparison, 
        p.value    = PT$p.value, 
        threshold  = 0.05)         
                                                              



