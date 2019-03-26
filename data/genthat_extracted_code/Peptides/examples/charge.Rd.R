library(Peptides)


### Name: charge
### Title: Compute the theoretical net charge of a protein sequence
### Aliases: charge

### ** Examples

# COMPARED TO EMBOSS PEPSTATS
# http://emboss.bioinformatics.nl/cgi-bin/emboss/pepstats
# SEQUENCE: FLPVLAGLTPSIVPKLVCLLTKKC
# Charge   = 3.0

charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 7, pKscale= "Bjellqvist")
# [1] 2.737303
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 7, pKscale= "EMBOSS")
# [1] 2.914112
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 7, pKscale= "Murray")
# [1] 2.907541
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 7, pKscale= "Sillero")
# [1] 2.919812
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 7, pKscale= "Solomon")
# [1] 2.844406
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 7, pKscale= "Stryer")
# [1] 2.876504
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 7, pKscale= "Lehninger")
# [1] 2.87315
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 7, pKscale= "Dawson")
# [1] 2.844406
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 7, pKscale= "Rodwell")
# [1] 2.819755

# COMPARED TO YADAMP
# http://yadamp.unisa.it/showItem.aspx?yadampid=845&x=0,7055475
# SEQUENCE: FLPVLAGLTPSIVPKLVCLLTKKC
# CHARGE pH5: 3.00
# CHARGE pH7: 2.91
# CHARGE pH9: 1.09
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 5, pKscale= "EMBOSS")
# [1] 3.037398
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 7, pKscale= "EMBOSS")
# [1] 2.914112
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= 9, pKscale= "EMBOSS")
# [1] 0.7184524

# JUST ONE COMMAND
charge(seq= "FLPVLAGLTPSIVPKLVCLLTKKC",pH= seq(from = 5,to = 9,by = 2), pKscale= "EMBOSS")
# [1] 3.0373984 2.9141123 0.7184524



