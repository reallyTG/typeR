library(cwhmisc)


### Name: Julian date
### Title: calender conversions
### Aliases: Dat2Jul Jul2Dat isLeap monthsN Mnames Dnames mdiny Wday Yday
### Keywords: math

### ** Examples

c(Jul2Dat(dd <- Dat2Jul( -4712,1,1) ) )
   # -4712, 1, 1, 12;  JD=0  i.e. Start of Julian day numbering
c(Jul2Dat(dd <- Dat2Jul( -1, 1, 1)),dd)
   #    -1,  1,  1, 12; JD=1720693 , start of last year BC
c(Jul2Dat(dd <- Dat2Jul( -1,12,31)),dd)
   #    -1, 12, 31, 12; JD=1721057 , last day BC
c(Jul2Dat(dd <- Dat2Jul( -0, 1, 1)),dd)
   #     0,  1,  1, 12; JD=1721058 , first day AD
c(Jul2Dat(dd <- Dat2Jul(  1, 1 ,1)),dd)
   #     1,  1,  1, 12; JD=1721424
c(Jul2Dat(dd <- Dat2Jul( 1582,10, 4 )),dd)
   #  1582, 10,  4, 12; 2299160, last day of Julian calendar
c(Jul2Dat(dd <- Dat2Jul( 1582,10,15)),dd)
   #  1582, 10, 15, 12; 2299161, first day of Gregorian calendar
round(c(Jul2Dat(dd <- Dat2Jul( 1582,10,15, 0.0168)),dd),1 )
   #  1582, 10, 15, 12; 2299160.5 first day of Gregorian calendar
c(Jul2Dat(dd <- Dat2Jul( 2001,1,1)),dd)
   #  2001,  1,  1, 12; 2451911
 mdiny(1,TRUE)    #  1 1
 mdiny(60,TRUE)   #  2 29



