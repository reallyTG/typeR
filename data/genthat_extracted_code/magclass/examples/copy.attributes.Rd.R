library(magclass)


### Name: copy.attributes
### Title: Copy Attributes
### Aliases: copy.attributes copy.attributes<- copy.attributes<-

### ** Examples


from <- array(12)
attr(from,"blablub") <- "I am an attribute!"
attr(from,"blablub2") <- "I am another attribute!"

print(attributes(from))

to <- as.magpie(0)
print(attributes(to))

copy.attributes(to) <- from
print(attributes(to))




