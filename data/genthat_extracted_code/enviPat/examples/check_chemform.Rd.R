library(enviPat)


### Name: check_chemform
### Title: Check chemical formulas
### Aliases: check_chemform

### ** Examples


# Check package data set of chemical formulas #############
data(chemforms);
data(isotopes);
checked<-check_chemform(isotopes,chemforms);
checked;

# Check for some senseless molecular formulas #############
chemforms<-c("C900Cl4H49","O82394","C8G500Zn9","Br1","6DBr9889");
data(isotopes);
checked<-check_chemform(isotopes,chemforms);
checked;

# Molecular mass with and without isotope labelling #######
chemforms<-c("C10H5N4O5","[13]C2C8D2H3[15]N2N2[18]O2O3");
data(isotopes);
checked<-check_chemform(isotopes,chemforms);
checked;




