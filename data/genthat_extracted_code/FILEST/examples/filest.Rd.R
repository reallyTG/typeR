library(FILEST)


### Name: filest
### Title: Simulate data for multiple populations
### Aliases: filest

### ** Examples


#Check and run the demo from demo.filest()
## No test: 
demo.filest()

#Here is the code for demo.filest()
txt <- "--setting=example1\n"
txt <- paste0(txt, "--population=500,500\n")
txt <- paste0(txt, "--fst=0.005,0.005\n")
txt <- paste0(txt, "--case=0,0\n")
txt <- paste0(txt, "--outlier=0,0\n")
txt <- paste0(txt, "--marker=3000\n")
txt <- paste0(txt, "--replicate=1\n")
txt <- paste0(txt, "--riskratio=1\n")
txt <- paste0(txt, "--no.case.snp=0\n")
txt <- paste0(txt, "--pc=TRUE\n")
txt <- paste0(txt, "--missing=0\n")
txt <- paste0(txt, "--fulloutput=TRUE\n")

outdir <- file.path(tempdir())

settingfile <- file.path(outdir, "example1.txt")
fo <- file(settingfile,"w")
for (i in txt){ write(i,fo)}
close(fo)

filest(setting = settingfile, out = outdir, thread = 1)
## End(No test)




