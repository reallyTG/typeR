library(genderizeR)


### Name: genderize
### Title: Predicting gender for character strings.
### Aliases: genderize

### ** Examples

## Not run: 
##D 
##D x = c("Winston J. Durant, ASHP past president, dies at 84", 
##D "Gold Badge of Honour of the DGAI Prof. Dr. med. Norbert R. Roewer Wuerzburg",
##D "The contribution of professor Yu.S. Martynov (1921-2008) to Russian neurology", 
##D "JAN BASZKIEWICZ (3 JANUARY 1930 - 27 JANUARY 2011) IN MEMORIAM", 
##D "Maria Sklodowska-Curie")
##D 
##D givenNames = findGivenNames(x)
##D givenNames = givenNames[count>40]
##D genderize(x, genderDB=givenNames, blacklist=NULL)
##D 
##D #                                                                             text
##D # 1:                            Winston J. Durant, ASHP past president, dies at 84
##D # 2:   Gold Badge of Honour of the DGAI Prof. Dr. med. Norbert R. Roewer Wuerzburg
##D # 3: The contribution of professor Yu.S. Martynov (1921-2008) to Russian neurology
##D # 4:                JAN BASZKIEWICZ (3 JANUARY 1930 - 27 JANUARY 2011) IN MEMORIAM
##D # 5:                                                        Maria Sklodowska-Curie
##D 
##D #    givenName gender genderIndicators
##D # 1:   winston   male                1
##D # 2:       med   male                2
##D # 3:        NA     NA                0
##D # 4:       jan   male                1
##D # 5:     maria female                1
##D 
## End(Not run)




