library(nlrx)


### Name: nldoc
### Title: Create NetLogo documentation
### Aliases: nldoc

### ** Examples


# List model files (.nls subfiles are also supported)
modelfiles <- c("https://raw.githubusercontent.com/nldoc/nldoc_pg/master/WSP.nlogo",
                "https://raw.githubusercontent.com/nldoc/nldoc_pg/master/WSP.nls")

# Define output directory:
outdir <- tempdir()  # adjust path to your needs

# Create documentation:
nldoc(modelfiles = modelfiles,
      infotab=TRUE,
      gui=TRUE,
      bs=TRUE,
      outpath = outdir,
      output_format = "html",
      number_sections = TRUE,
      theme = "cosmo",
      date = date(),
      toc = TRUE)




