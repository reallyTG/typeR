library(TAM)


### Name: doparse
### Title: Parsing a String with 'DO' Statements
### Aliases: doparse
### Keywords: DO statements

### ** Examples

#############################################################################
# EXAMPLE 1: doparse example
#############################################################################

# define model
model <- "
 # items I1,...,I10 load on G
 DO(1,10,1)
   G=~ lamg% * I%
 DOEND
 I2 | 0.75*t1
 v10 > 0 ;
 # The first index loops from 1 to 3 and the second index loops from 1 to 2
 DO2(1,3,1,  1,2,1)
   F%2=~ a%2%1 * A%2%1 ;
 DOEND
 # Loop from 1 to 9 with steps of 2
 DO(1,9,2)
   HA1=~ I%
   I% | beta% * t1
 DOEND
 "

# process string
out <- TAM::doparse(model)
cat(out)
  ##    # items I1,...,I10 load on G
  ##       G=~ lamg1 * I1
  ##       G=~ lamg2 * I2
  ##       G=~ lamg3 * I3
  ##       G=~ lamg4 * I4
  ##       G=~ lamg5 * I5
  ##       G=~ lamg6 * I6
  ##       G=~ lamg7 * I7
  ##       G=~ lamg8 * I8
  ##       G=~ lamg9 * I9
  ##       G=~ lamg10 * I10
  ##     I2 | 0.75*t1
  ##     v10 > 0
  ##       F1=~ a11 * A11
  ##       F2=~ a21 * A21
  ##       F1=~ a12 * A12
  ##       F2=~ a22 * A22
  ##       F1=~ a13 * A13
  ##       F2=~ a23 * A23
  ##       HA1=~ I1
  ##       HA1=~ I3
  ##       HA1=~ I5
  ##       HA1=~ I7
  ##       HA1=~ I9
  ##       I1 | beta1 * t1
  ##       I3 | beta3 * t1
  ##       I5 | beta5 * t1
  ##       I7 | beta7 * t1
  ##       I9 | beta9 * t1

#############################################################################
# EXAMPLE 2: doparse with nested loop example
#############################################################################

# define model
model <- "
 DO(1,4,1)
   G=~ lamg% * I%
 DOEND
 # specify some correlated residuals
 DO2(1,3,1,%1,4,1)
   I%1 ~~ I%2
 DOEND
 "
# process string
out <- TAM::doparse(model)
cat(out)
  ##       G=~ lamg1 * I1
  ##       G=~ lamg2 * I2
  ##       G=~ lamg3 * I3
  ##       G=~ lamg4 * I4
  ##     # specify some correlated residuals
  ##       I1 ~~ I2
  ##       I1 ~~ I3
  ##       I1 ~~ I4
  ##       I2 ~~ I3
  ##       I2 ~~ I4
  ##       I3 ~~ I4



