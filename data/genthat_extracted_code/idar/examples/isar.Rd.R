library(idar)


### Name: isar
### Title: Individual Diversity Area Relationships
### Aliases: isar ipscar ipsear ipsvar ipsrar ifdar
### Keywords: spatial

### ** Examples


# ISAR
   # Point pattern with a data.frame of marks
   data(SF)
   isar.sp_44 <- isar(mippp = SF, mimark="sp_44", namesmark="species", r=1:40) 
   plot(isar.sp_44)
 
   # Point pattern with just a vector of marks
    data(lansing)
    isar.blackoak <- isar(mippp = lansing, mimark="blackoak",  r=seq(0.01, 0.25, le=100))
    plot(isar.blackoak)

   # Examples of the use of different buffers
     # No  buffer at all (by deffault, buffer = 0)
     isar.sp_44.0 <- isar(mippp = SF, mimark="sp_44", namesmark="species", r=1:18)    

     # Adaptive buffer (for each r, use only points within a r distance form the border)
     isar.sp_44.a <- isar(mippp = SF, mimark="sp_44", namesmark="species", r=1:18,
                                buffer="adapt") 

     # Predefined window, for example with a buffer of 7 m within plot limits
     mibfw<- erosion(SF$win, r=7)
      isar.sp_44.w <- isar(mippp = SF, mimark="sp_44", namesmark="species", r=1:18, bfw=mibfw) 


   ######################
   ### Phylogenetic functions ###
   ######################
   
data(SFphylotree)

# IPSCAR
    ipscar.sp_44 <- ipscar(mippp = SF, mimark="sp_44", namesmark="species", r=1:40,
                                     tree=SFphylotree)
    plot(ipscar.sp_44)
 
# IPSEAR
    ipsear.sp_44 <- ipsear(mippp = SF, mimark="sp_44", namesmark="species", r=1:40,
                                  tree=SFphylotree)
    plot(ipsear.sp_44)

# IPSVAR
    ipsvar.sp_44 <- ipsvar(mippp = SF, mimark="sp_44", namesmark="species", r=1:40,
                                   tree=SFphylotree)
    plot(ipsvar.sp_44)

# IPSRAR
    ipsrar.sp_44 <- ipsrar(mippp = SF, mimark="sp_44", namesmark="species", r=1:40,
                                  tree=SFphylotree)
    plot(ipsrar.sp_44)
 
  #####################
  ###  Functional functions ###
  #####################
 
data(SFtraits)

# IFDAR
   # this will cause an error becuse some species have NA's in the vector of trait values
## Not run: 
##D    ifdar.sp_44 <- ifdar(mippp = SF, mimark="sp_44", namesmark="species", traits=SFtraits,
##D                               r=1:40, correct.trait="exclude")
## End(Not run)
   # "correct" NA's in trait values  by assigning tospecies without traits the average of the trait 
   # for  all the other species
   ifdar.sp_44 <- ifdar(mippp = SF, mimark="sp_44", namesmark="species",  traits=SFtraits,
			      r=1:40, correct.trait.na=TRUE)

    #"correct"  the existence of NA's in trait values  by excluding species without traits from the
    # analysis
    ifdar.sp_44 <- ifdar(mippp = SF, mimark="sp_44", namesmark="species", traits=SFtraits,
                               r=1:40, correct.trait.na=TRUE,correct.trait="exclude")

     plot(ifdar.sp_44)

# For examples of envelopes for these functions  see the help page of ipsim() or envelope4idar()




