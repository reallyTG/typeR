library(worms)


### Name: wormsaccepted
### Title: Constructs "accepted_id" column which contains the "AphiaID" of
###   the respective "accepted" taxon
### Aliases: wormsaccepted

### ** Examples

## start with IDs that are no longer up to date 
# get the Aphia information
u<-wormsbyid(c(424548,340537))

#recursively retrive information on the taxa they refer to
v<-wormsconsolidate(u)

# what are the currently correct "accepted" taxa? Answer: "accepted_id".
w<-wormsaccepted(v)
w[,c("scientificname","AphiaID","status","valid_AphiaID","valid_name","accepted_id")]





