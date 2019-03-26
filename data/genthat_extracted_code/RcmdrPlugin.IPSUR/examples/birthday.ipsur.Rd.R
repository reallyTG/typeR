library(RcmdrPlugin.IPSUR)


### Name: birthday.ipsur
### Title: Probability of coincidences for the IPSUR package
### Aliases: qbirthday.ipsur pbirthday.ipsur
### Keywords: distribution

### ** Examples

 ## the standard version
qbirthday.ipsur()
 ## same 4-digit PIN number
qbirthday.ipsur(classes=10^4)
 ## 0.9 probability of three coincident birthdays
qbirthday.ipsur(coincident=3, prob=0.9)
## Chance of 4 coincident birthdays in 150 people
pbirthday.ipsur(150,coincident=4)
## 100 coincident birthdays in 1000 people: *very* rare:
pbirthday.ipsur(1000, coincident=100)




