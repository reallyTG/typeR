library(FSA)


### Name: lencat
### Title: Constructs length class/category variable.
### Aliases: lencat lencat.default lencat.formula
### Keywords: manip

### ** Examples

# Create random lengths measured to nearest 0.1 unit
df1 <- data.frame(len=round(runif(50,0.1,9.9),1))

# Create length categories by 0.1 unit
df1$LCat1 <- lencat(df1$len,w=0.1)
xtabs(~LCat1,data=df1)

# length categories by 0.2 units
df1$LCat2 <- lencat(df1$len,w=0.2)
xtabs(~LCat2,data=df1)

# length categories by 0.2 units starting at 0.1
df1$LCat3 <- lencat(df1$len,w=0.2,startcat=0.1)
xtabs(~LCat3,data=df1)

# length categories as set by breaks
df1$LCat4 <- lencat(df1$len,breaks=c(0,2,4,7,10))
xtabs(~LCat4,data=df1)

## A Second example
# random lengths measured to nearest unit
df2 <- data.frame(len=round(runif(50,10,117),0))    

# length categories by 5 units
df2$LCat1 <- lencat(df2$len,w=5)
xtabs(~LCat1,data=df2)

# length categories by 5 units starting at 7
df2$LCat2 <- lencat(df2$len,w=5,startcat=7)
xtabs(~LCat2,data=df2)

# length categories by 10 units
df2$LCat3 <- lencat(df2$len,w=10)
xtabs(~LCat3,data=df2)

# length categories by 10 units starting at 5
df2$LCat4 <- lencat(df2$len,w=10,startcat=5)
xtabs(~LCat4,data=df2)

# length categories as set by breaks
df2$LCat5 <- lencat(df2$len,breaks=c(5,50,75,150))
xtabs(~LCat5,data=df2)

## A Third example
# random lengths measured to nearest 0.1 unit
df3 <- data.frame(len=round(runif(50,10,117),1))

# length categories by 5 units
df3$LCat1 <- lencat(df3$len,w=5)
xtabs(~LCat1,data=df3)

## A Fourth example
# random lengths measured to nearest 0.01 unit
df4 <- data.frame(len=round(runif(50,0.1,9.9),2))

# length categories by 0.1 unit
df4$LCat1 <- lencat(df4$len,w=0.1)
xtabs(~LCat1,data=df4)

# length categories by 0.1 unit, but without missing categories
df4$LCat2 <- lencat(df4$len,w=0.1,as.fact=TRUE)
xtabs(~LCat2,data=df4)

# length categories by 2 unit
df4$LCat3 <- lencat(df4$len,w=2)
xtabs(~LCat3,data=df4)

## A Fifth example -- with real data
# remove variables with "anu" and "radcap" just for simplicity
smb1 <- smb2 <- SMBassWB[,-c(8:20)]

# 10 mm length classes - in default LCat variable
smb1$LCat10 <- lencat(smb1$lencap,w=10)
head(smb1)
xtabs(~LCat10,data=smb1)

# Same as previous but returned as a factor so that levels with no fish are still seen
smb1$LCat10A <- lencat(smb1$lencap,w=10,as.fact=TRUE)
head(smb1)
xtabs(~LCat10A,data=smb1)

# Same as previous but returned as a factor with unused levels dropped
smb1$LCat10B <- lencat(smb1$lencap,w=10,as.fact=TRUE,droplevels=TRUE)
head(smb1)
xtabs(~LCat10B,data=smb1)

# 25 mm length classes - in custom variable name
smb1$LCat25 <- lencat(smb1$lencap,w=25)
head(smb1)
xtabs(~LCat25,data=smb1)

# using values from psdVal for Smallmouth Bass
smb1$PSDCat1 <- lencat(smb1$lencap,breaks=psdVal("Smallmouth Bass"))
head(smb1)
xtabs(~PSDCat1,data=smb1)

# add category names
smb1$PSDCat2 <- lencat(smb1$lencap,breaks=psdVal("Smallmouth Bass"),use.names=TRUE)
head(smb1)
xtabs(~PSDCat2,data=smb1)

# same as above but drop the unused levels
smb1$PSDCat2A <- lencat(smb1$lencap,breaks=psdVal("Smallmouth Bass"),
                        use.names=TRUE,droplevels=TRUE)
head(smb1)
xtabs(~PSDCat2A,data=smb1)
str(smb1)

# same as above but not returned as a factor (returned as a character)
smb1$PSDcat2B <- lencat(smb1$lencap,breaks=psdVal("Smallmouth Bass"),
                        use.names=TRUE,as.fact=FALSE)
str(smb1)

## A Sixth example -- similar to the fifth example but using the formula notation
# 10 mm length classes - in default LCat variable
smb2 <- lencat(~lencap,data=smb2,w=10)
head(smb2)

# 25 mm length classes - in custom variable name
smb2 <- lencat(~lencap,data=smb2,w=25,vname="LenCat25")
head(smb2)

# using values from psdVal for Smallmouth Bass
smb2 <- lencat(~lencap,data=smb2,breaks=psdVal("Smallmouth Bass"),vname="LenPsd")
head(smb2)

# add category names
smb2 <- lencat(~lencap,data=smb2,breaks=psdVal("Smallmouth Bass"),vname="LenPsd2",
               use.names=TRUE,droplevels=TRUE)
head(smb2)
str(smb2)




