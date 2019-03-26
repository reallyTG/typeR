library(pems.utils)


### Name: 2.3.4.unit.handlers
### Title: data unit handlers
### Aliases: 2.3.4.unit.handlers getUnits setUnits convertUnits
###   addUnitConversion addUnitAlias listUnitConversions
### Keywords: methods

### ** Examples


###########
##example 1 
###########

#work with data units

#getting units (where assigned)
getUnits(velocity, pems.1) #km/h

#setting units
a <- 1:10
a <- setUnits(a, "km/h") #add unit 

#alternaltive 
#using pems.element
#a <- pems.element(a, units="km/h", name = "a") 

#changing units
convertUnits(a, "mi/h")

# [1] 0.6213712 1.2427424 1.8641136 2.4854848 3.1068560 3.7282272 4.3495983
# [8] 4.9709695 5.5923407 6.2137119
# pems.element; [unnamed] [mi/h] [n = 10]

###########
##example 2
###########

#working with local unit conversions
#adding/updating unit conversion methods

#make a local reference
ref.list <- ref.unit.conversions 

#add a miles/hour alias to mi/h
ref.list <- addUnitAlias("mi/h", "miles/hour", ref.list)

#add a new conversion
ref.list <- addUnitConversion(to = "silly", from = "km/h", 
                              conversion = function(x) 12 + (21 * x), 
                              tag = "kilometers/hour to some silly scale",
                              unit.conversions = ref.list)

#use these
convertUnits(a, "miles/hour", unit.conversions = ref.list)

# [1] 0.6213712 1.2427424 1.8641136 2.4854848 3.1068560 3.7282272 4.3495983
# [8] 4.9709695 5.5923407 6.2137119
# units: "miles/hour" (as above but using your unit abbreviations)

convertUnits(a, "silly", unit.conversions = ref.list)

# [1]  33  54  75  96 117 138 159 180 201 222
# units: "silly" (well, you get what you ask for)




