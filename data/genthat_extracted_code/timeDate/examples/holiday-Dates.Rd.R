library(timeDate)


### Name: holidayDate
### Title: Public and Ecclesiastical Holidays
### Aliases: holidayDate Septuagesima Quinquagesima AshWednesday PalmSunday
###   GoodFriday EasterSunday EasterMonday RogationSunday Ascension
###   Pentecost PentecostMonday TrinitySunday CorpusChristi ChristTheKing
###   Advent1st Advent2nd Advent3rd Advent4th ChristmasEve ChristmasDay
###   BoxingDay NewYearsDay SolemnityOfMary Epiphany PresentationOfLord
###   Annunciation TransfigurationOfLord AssumptionOfMary BirthOfVirginMary
###   CelebrationOfHolyCross MassOfArchangels AllSaints AllSouls LaborDay
###   CHBerchtoldsDay CHSechselaeuten CHAscension CHConfederationDay
###   CHKnabenschiessen GBMayDay GBBankHoliday GBSummerBankHoliday
###   GBMilleniumDay DEAscension DECorpusChristi DEGermanUnity
###   DEChristmasEve DENewYearsEve FRFetDeLaVictoire1945 FRAscension
###   FRBastilleDay FRAssumptionVirginMary FRAllSaints FRArmisticeDay
###   ITEpiphany ITLiberationDay ITAssumptionOfVirginMary ITAllSaints
###   ITStAmrose ITImmaculateConception USDecorationMemorialDay
###   USPresidentsDay USNewYearsDay USInaugurationDay USMLKingsBirthday
###   USLincolnsBirthday USWashingtonsBirthday USMemorialDay
###   USIndependenceDay USLaborDay USColumbusDay USElectionDay
###   USVeteransDay USThanksgivingDay USChristmasDay USCPulaskisBirthday
###   USGoodFriday CAVictoriaDay CAFamilyDay CACanadaDay
###   CACivicProvincialHoliday CALabourDay CAThanksgivingDay
###   CaRemembranceDay JPVernalEquinox JPNewYearsDay JPGantan
###   JPBankHolidayJan2 JPBankHolidayJan3 JPComingOfAgeDay JPSeijinNoHi
###   JPNatFoundationDay JPKenkokuKinenNoHi JPGreeneryDay JPMidoriNoHi
###   JPConstitutionDay JPKenpouKinenBi JPNationHoliday JPKokuminNoKyujitu
###   JPChildrensDay JPKodomoNoHi JPMarineDay JPUmiNoHi
###   JPRespectForTheAgedDay JPKeirouNOhi JPAutumnalEquinox JPShuubunNoHi
###   JPHealthandSportsDay JPTaiikuNoHi JPNationalCultureDay JPBunkaNoHi
###   JPThanksgivingDay JPKinrouKanshaNoHi JPEmperorsBirthday
###   JPTennouTanjyouBi JPBankHolidayDec31
### Keywords: chron

### ** Examples

## listHolidays -
   listHolidays()

## CHSechselaeuten -
   # Sechselaeuten a half Day Bank Holiday in Switzerland
   CHSechselaeuten(2000:2010)
   CHSechselaeuten(getRmetricsOptions("currentYear"))

## German Unification Day:
   DEGermanUnity(getRmetricsOptions("currentYear"))



