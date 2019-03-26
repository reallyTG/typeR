library(taxize)


### Name: itis_acceptname
### Title: Retrieve accepted TSN and name
### Aliases: itis_acceptname

### ** Examples

## Not run: 
##D # TSN accepted - good name
##D itis_acceptname(searchtsn = 208527)
##D 
##D # TSN not accepted - input TSN is old
##D itis_acceptname(searchtsn = 504239)
##D 
##D # many accepted names
##D ids <- c(18161, 18162, 18163, 18164, 18165, 18166, 46173, 46174,
##D 46178, 46181, 46186, 46193, 46196, 46197, 46200, 46201, 46204,
##D 46207, 46867, 46868)
##D itis_acceptname(searchtsn = ids)
##D 
##D # many unaccepted names
##D ids <- c(39087, 46208, 46973, 46976, 46978, 46980, 47295, 47445,
##D 47448, 47512, 47515, 47527, 47546, 47622, 47783, 47786, 47787,
##D 47788, 47835, 47839)
##D itis_acceptname(searchtsn = ids)
##D 
##D # many: mix of accepted and unaccepted names
##D ids <- c(18161, 18162, 47527, 47546, 47622, 46200)
##D itis_acceptname(searchtsn = ids)
## End(Not run)



