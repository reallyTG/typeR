library(MSPRT)


### Name: find.alt
### Title: Finding the 'fixed design alternative'
### Aliases: find.alt

### ** Examples

## finding the alternative in case of a proportion test which
## provides 80% power against a right and left sided
## alternative, respectively

# default null = 0.5
find.alt(test.type="prop.test", side= "right", size= 60,
         type1= 0.005, type2= 0.2)
         
find.alt(test.type="prop.test", side= "left", size= 60,
         type1= 0.005, type2= 0.2)

# null = 0.2         
find.alt(test.type="prop.test", side= "right", null= 0.2,
         size= 60, type1= 0.005, type2= 0.2)
         
find.alt(test.type="prop.test", side= "left", null= 0.2,
         size= 60, type1= 0.005, type2= 0.2)


## finding the alternative in case of a Z-test which
## provides 80% power against a right and left sided
## alternative, respectively

# default null = 0
find.alt(test.type="z.test", side= "right",
         size= 60, type1= 0.005, type2= 0.2, sigma0= 1)

find.alt(test.type="z.test", side= "left",
         size= 60, type1= 0.005, type2= 0.2, sigma0= 1)
         
# null = 3
find.alt(test.type="z.test", side= "right", null= 3,
         size= 60, type1= 0.005, type2= 0.2, sigma0= 1)

find.alt(test.type="z.test", side= "left", null= 3,
         size= 60, type1= 0.005, type2= 0.2, sigma0= 1)
         

## finding the alternative in case of a T-test which
## provides 80% power against a right and left sided
## alternative, respectively

# default null = 0
find.alt(test.type="t.test", side= "right", size= 60,
         type1= 0.005, type2= 0.2)
         
find.alt(test.type="t.test", side= "left", size= 60,
         type1= 0.005, type2= 0.2)
         
# null = 3
find.alt(test.type="t.test", side= "right", null= 3,
         size= 60, type1= 0.005, type2= 0.2)
         
find.alt(test.type="t.test", side= "left", null= 3,
         size= 60, type1= 0.005, type2= 0.2)




