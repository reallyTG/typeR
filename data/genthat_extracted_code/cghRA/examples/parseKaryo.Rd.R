library(cghRA)


### Name: parseKaryo
### Title: Parses a karyotype-like formula
### Aliases: parseKaryo

### ** Examples

  ## Not run: 
##D     karyo <- paste(
##D       "111<5n>,6(1qt-p11),4(1p11-pt),4(2),8(3),4(4),6(5),6(6pt-q22),6(6q26-qt),",
##D       "2(6q22-q26),6(7pt-q31),3(7q31-qt),6(9),4(10),4(11),4(12),6(13),4(14),",
##D       "4(15pt-q22),2(15q22-qt),2(16),4(17),6(18),4(19),4(21),4(22) [6] ; 46<2n> [7]",
##D       collapse = ""
##D     )
##D     parseKaryo(karyo, bandTrack)
##D   
## End(Not run)



