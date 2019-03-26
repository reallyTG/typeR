library(idar)


### Name: localdar
### Title: Map Local Diversity Area Relationships
### Aliases: localdar fdismap raoDmap
### Keywords: spatial

### ** Examples


# Map of local species area-relationship [ISAR(r)] in San Francisco plot at r=5 and r= 6 m
  data(SF)
  data(SFphylotree)
  data(SFtraits)

  isarSF <- localdar(SF, r=5:6, namesmark="species")
  
  isarSF
  
  plot(isarSF[[1]])
  
  
# Map of local species area-relationship [ISAR(r)] in San Francisco plot at r=5 and r= 6 m,
# with an adaptive buffer

isarSF <- localdar(SF, r=5:6, namesmark="species",buffer="adapt")



# Map of local species area-relationship [ISAR(r)] in lansing woods at different radii,
# with an fixed  buffer (only for rectangular windows).

data(lansing)
lansing.bfw<- owin(c(0.2,0.8),c(0.2,0.8))
lansing.lsar.bf<-localdar(lansing, r=seq(0.05,0.2,by=0.05), bfw=lansing.bfw)


# Map of local species area-relationship [ISAR(r)] in San Francisco plot at r=5 and r= 6 m,
# with a buffer of 7 m within plot limits

  mibfw<- erosion(SF$win, r=7)

 isarSF <- localdar(SF, r=5:6, namesmark="species", bfw=mibfw)



# Estimate local species area-relationship [ISAR(r)] in the local communities 
#  in circles with radius  r=5 and r= 6 m around the individuals of sp_44

  sp_44_sar <- localdar(SF, r=5:6, namesmark="species", mimark="sp_44")
  sp_44_sar
  plot(sp_44_sar[[1]])
  sp_44_sar[[1]]$marks
  


# Estimate local species area-relationship [ISAR(r)] in the local communities 
#  in circles with radius  r=5 and r= 6 m around the individuals of sp_44
# EXCLUDING the focal species from species counts.

  sp_44_sar <- localdar(SF, r=5:6, namesmark="species", mimark="sp_44", cross.idar=TRUE)
  sp_44_sar
  plot(sp_44_sar[[1]])
  sp_44_sar[[1]]$marks
 
  
  


# Map and estimation of local Phylogenetic Species Variety
local_psvar<-localdar(SF, r=5:6, idar="ipsvar", tree=SFphylotree, namesmark="species")
sp44_psvar <- localdar(SF, r=5:6, idar="ipsvar", tree=SFphylotree, namesmark="species",
                                    mimark="sp_44", buffer="adapt")

# Map and estimation of local Functional Dispersion
local_fdar <- localdar(SF, nx=50, ny=25, r=5:6,  idar="ifdar", traits=SFtraits,
                                 namesmark="species", correct.trait.na=TRUE)
sp44_fdar <- localdar(SF, nx=50, ny=25, r=5:6,  idar="ifdar", traits=SFtraits,
                                  namesmark="species", mimark="sp_44", correct.trait.na=TRUE)


# Map of a local community weighted mean of wood density
# first, put the wood desnsity data as a named vector
 wood.density.vec<-unlist(SFtraits[,  "wood.density", drop=FALSE])
    names(wood.density.vec)<- rownames(SFtraits)
    
local_cwd <- localdar(SF, r=5:6,  idar="icwmar", traits=wood.density.vec,
                                  namesmark="species", correct.trait.na=TRUE)
local_O.cwm <-localdar(SF, r=5:6, idar="icwmar.O", traits=wood.density.vec, 
                                     namesmark="species", correct.trait.na=TRUE)

# Map of Rao's phylogenetic diversity
local_rao<- localdar(SF,  r=5:6, idar="iraodar",  tree=SFphylotree, namesmark="species")
local_O.rao <- localdar(SF, r=5:6, idar="iraodar.O",  tree=SFphylotree, namesmark="species")

# Map of local mean nearest taxon distance 
local_mntd <- localdar(SF, r=5:6, idar="imntdar",  tree=SFphylotree, namesmark="species")





