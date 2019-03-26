library(voxel)


### Name: gamRandomise
### Title: Generate FSL Randomise call for a GAM Model
### Aliases: gamRandomise

### ** Examples

## Not run: 
##D 
##D subjData = mgcv::gamSim(1,n=400,dist="normal",scale=2)
##D OutDirRoot="Output Directory"
##D maskName="Path to mask"
##D imagePath="Path to output"
##D covsFormula="~s(age,k=5)+sex+mprage_antsCT_vol_TBV"
##D redFormula="~sex+mprage_antsCT_vol_TBV"
##D 
##D gamRandomise(image = imagePath, maskPath = maskName, formulaFull = covsFormula, 
##D            formulaRed = redFormula, subjData = subjData, outDir = OutDirRoot)
##D 
## End(Not run)




