library(vcdExtra)


### Name: Fungicide
### Title: Carcinogenic Effects of a Fungicide
### Aliases: Fungicide
### Keywords: datasets

### ** Examples

data(Fungicide)
# loddsratio was moved to vcd; requires vcd_1.3-3+
## Not run: 
##D if (require(vcd)) {
##D fung.lor <- loddsratio(Fungicide, correct=TRUE)
##D fung.lor
##D confint(fung.lor)
##D }
## End(Not run)

# visualize odds ratios in fourfold plots
cotabplot(Fungicide, panel=cotab_fourfold)
#  -- fourfold() requires vcd >= 1.2-10
fourfold(Fungicide, p_adjust_method="none")






