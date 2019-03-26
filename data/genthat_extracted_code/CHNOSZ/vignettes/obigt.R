## ----library_CHNOSZ, include=FALSE---------------------------------------
library(CHNOSZ)

## ----data_thermo, include=FALSE------------------------------------------
data(thermo)

## ----nspecies, include=FALSE---------------------------------------------
# assign the file name to a variable and print the file name and number of species
setfile <- function(csvfile, dat=NULL) {
  # assign csvfile outside this function
  assign("csvfile", csvfile, parent.frame())
  # files might have .csv or .csv.xz suffix
  file <- system.file(paste0("extdata/OBIGT/", csvfile), package="CHNOSZ")
  if(file=="") file <- system.file(paste0("extdata/OBIGT/", csvfile, ".xz"), package="CHNOSZ")
  dat <- read.csv(file, as.is=TRUE)
  ## exclude entries for phase transitions
  #dat <- dat[!dat$state %in% c("cr2", "cr3", "cr4", "cr5", "cr6", "cr7", "cr8", "cr9"), ]
  # the class of substance (used as section header), followed by number of species
  class <- gsub(".csv", "", gsub("_.*", "", csvfile))
  substr(class, 1, 1) <- toupper(substr(class, 1, 1))
  paste0("`", class, "` (", nrow(dat), ")")
}

## ----filerefs, include=FALSE---------------------------------------------
filerefs <- function(csvfile, dat=NULL, message=FALSE) {
  # with dat, look for ref2 in dat
  whichref <- "ref2"
  # without dat, look for ref1 in csvfile
  if(is.null(dat)) {
    file <- system.file(paste0("extdata/OBIGT/", csvfile), package="CHNOSZ")
    if(file=="") file <- system.file(paste0("extdata/OBIGT/", csvfile, ".xz"), package="CHNOSZ")
    dat <- read.csv(file, as.is=TRUE)
    whichref <- "ref1"
  }
  ## exclude entries for phase transitions
  #dat <- dat[!dat$state %in% c("cr2", "cr3", "cr4", "cr5", "cr6", "cr7", "cr8", "cr9"), ]
  # count number of times each reference is used
  tab <- table(dat[, whichref])
  # there are no references in H2O_aq.csv so we return the species here
  if(length(tab)==0) return(paste(dat$name, dat$state))
  # the keys only (no [S92] etc.)
  keys <- sapply(strsplit(names(tab), " "), "[", 1)
  # warn if any keys aren't in thermo$ref$key
  ikey <- match(keys, thermo$ref$key)
  ina <- is.na(ikey)
  if(any(ina)) cat(paste("**WARNING: key(s)", paste(names(tab)[ina], collapse=" "), "not found in `thermo$ref$key`**\n\n"))
  # put the table in chronological order, according to thermo$ref
  #ikey <- na.omit(match(thermo$ref$key, keys))
  ikey <- order(match(keys, thermo$ref$key)) # works for duplicated keys (e.g. "Sho92" and "Sho92 [S98]")
  tab <- tab[ikey]
  keys <- keys[ikey]
  xxx <- lapply(seq_along(tab), function(i){
    thiskey <- keys[i]
    # read thermo$ref$note
    iref <- match(thiskey, thermo$ref$key)
    note <- thermo$ref$note[iref]
    if(!identical(note, "")) note <- paste0(" *", note, "* ")
    # append symbol for [S92], [S98], or [S15]
    if(grepl("[S92]", names(tab)[i], fixed=TRUE) | grepl("SPRONS92", names(tab)[i], fixed=TRUE)) note <- paste0(note, "(ø)")
    if(grepl("[S98]", names(tab)[i], fixed=TRUE) | grepl("SLOP98", names(tab)[i], fixed=TRUE)) note <- paste0(note, "(\\*)")
    if(grepl("[S07]", names(tab)[i], fixed=TRUE) | grepl("SLOP07", names(tab)[i], fixed=TRUE)) note <- paste0(note, "(†)")
    if(grepl("[S15]", names(tab)[i], fixed=TRUE) | grepl("SLOP15", names(tab)[i], fixed=TRUE)) note <- paste0(note, "(‡)")
    # use bullets for ref2
    if(whichref=="ref2") bullet <- "- " else bullet <- ""
    # convert key (e.g. LD12.2) to ref in OBIGT.bib (e.g. LD12)
    thisref <- gsub("\\..*$", "", thiskey)
    # replace SLOP98 with slop98.dat, etc.
    # (we don't actually cite them here to keep the year from showing -- it's annoying to see e.g. "slop98.dat (1998)")
    citemark <- "@"
    if(thisref=="SLOP15") { thisref <- "slop15.dat"; citemark <- "" }
    if(thisref=="SLOP07") { thisref <- "slop07.dat"; citemark <- "" }
    if(thisref=="SLOP98") { thisref <- "slop98.dat"; citemark <- "" }
    if(thisref=="SPRONS92") { thisref <- "sprons92.dat"; citemark <- "" }
    if(thisref=="CHNOSZ") { citemark <- "" }
    cat(bullet, citemark, thisref, " -- ", tab[i], note, "\n\n", sep="")
    # get ref2 if we're in the outer list
    if(whichref!="ref2") filerefs(dat=dat[dat$ref1==names(tab)[i], ])
  })
  # return all the species listed
  paste(dat$name, dat$state)
}

## ----H2O_aq, results="asis", echo=FALSE----------------------------------
cat('This file contains H<sub>2</sub>O, *e*<sup>-</sup>, and H<sup>+</sup>.\n')
cat('The properties of H<sub>2</sub>O are listed as NA; CHNOSZ calculates its properties using a Fortran subroutine taken from SUPRCT92 ([Johnson et al., 1992](https://doi.org/10.1016/0098-3004(92)90029-Q)) (default) or using the IAPWS-95 equations ([Wagner and Pruß, 2002](https://doi.org/10.1063/1.1461829)) or the [Deep Earth Water](http://www.dewcommunity.org/) (DEW) model ([Sverjensky et al., 2014](https://doi.org/10.1016/j.gca.2013.12.019)).\n\n')
cat('By convention, the standard Gibbs energy of formation, entropy, and heat capacity of the aqueous proton (H<sup>+</sup>) are 0 at all *T* and *P* ([e.g. Cox et al., 1989](http://www.worldcat.org/oclc/18559968)).\n')
cat('The formation reaction of the proton can be expressed as &frac12;H<sub>2,(*g*)</sub> + Z = H<sup>+</sup>, where Z is the "element" of positive charge.\n')
cat('Because the conventional standard Gibbs energy of this reaction is 0 at all *T*, the standard entropy of the reaction is also constrained to be zero (cf. [Puigdomenech et al., 1997](http://www.oecd-nea.org/dbtdb/pubs/book-pdf/427-494.pdf)).\n')
cat('Therefore, the "element" of positive charge (Z) has zero thermodynamic properties except for an entropy, *S*°<sub>*T*<sub>r</sub></sub>, that is negative one-half that of H<sub>2,(*g*)</sub>.\n')
cat('The standard entropy of the aqueous electron, which is a solely a pseudospecies defined by *e*<sup>-</sup> = -Z, is opposite that of Z.<span style="color:red">**</span>\n\n')
cat('Despite these considerations, the final column of the thermodynamic database (`thermo$obigt`) lists a charge of "0" for both the aqueous proton and electron.\n')
cat('Data in this this column are used in CHNOSZ only to specify the charge that is input to the "*g*-function" ([Tanger and Helgeson, 1988](https://doi.org/10.2475/ajs.288.1.19); [Shock and Helgeson, 1988](https://doi.org/10.1016/0016-7037(88)90181-0)).\n')
cat('Setting it to zero prevents activation of the *g*-function, which would result in non-zero contributions to thermodynamic properties, conflicting with the conventions mentioned above.\n')
cat('All other calculations in CHNOSZ obtain the elemental makeup, including the correct charge for the species, by parsing the chemical formulas stored in the database.<span style="color:red">^^</span>\n\n')
cat('<span style="color:red">**</span>Likewise, [GEM-Selektor](http://gems.web.psi.ch/) defines "independent components" to be stoichiometric units usually consisting of elements and charge; the latter, [which is named Zz](http://gems.web.psi.ch/tests/TestNaCl-dep.html) and has a standard molal entropy of -65.34 J/mol/K and heat capacity of -14.418 J/mol/K (negative one-half those of gaseous hydrogen), is negated in the formula of the fictive "aqueous electron" ([Kulik, 2006](https://doi.org/10.1016/j.chemgeo.2005.08.014)).\n\n')
cat('<span style="color:red">^^</span> Relatedly, charged amino acid sidechain groups have a charge that is tabulated as zero, because other values would be incompatible with group additivity of cations and anions (which have derivatives of the omega parameter (&omega;) in the revised HKF equations of state that are not opposites of each other) to give a neutral species (for which the derivatives of &omega; are taken to be zero) (cf. [Dick et al., 2006](https://doi.org/10.5194/bg-3-311-2006)).\n')

## ----used, include=FALSE-------------------------------------------------
# initialize the list of used species
used <- character()

## ----reflist, results="asis", echo=FALSE---------------------------------
used <- c(used, filerefs(csvfile))

## ----inorganic_aq, results="asis", echo=FALSE----------------------------
cat("ZnCl<sub>4</sub><sup>-2</sup> was present in sprons92.dat but not in slop98.dat or later files, and is not included in CHNOSZ.<hr>")

## ----reflist, results="asis", echo=FALSE---------------------------------
used <- c(used, filerefs(csvfile))

## ----reflist, results="asis", echo=FALSE---------------------------------
used <- c(used, filerefs(csvfile))

## ----reflist, results="asis", echo=FALSE---------------------------------
used <- c(used, filerefs(csvfile))

## ----inorganic_cr, results="asis", echo=FALSE----------------------------
cat("Chamosite,7A and witherite were present in sprons92.dat but not in slop98.dat or later files, and are not included in CHNOSZ.\n\n")
cat("The source of parameters used here for goethite is different from that in the slop files ([Shock, 2009](https://doi.org/10.2113/gsecongeo.104.8.1235)).<hr>")

## ----reflist, results="asis", echo=FALSE---------------------------------
used <- c(used, filerefs(csvfile))

## ----reflist, results="asis", echo=FALSE---------------------------------
used <- c(used, filerefs(csvfile))

## ----Berman_cr, results="asis", echo=FALSE-------------------------------
cat("This file gives the identifiying information for minerals whose properties are calculated using the formulation of [Berman (1988)](https://doi.org/10.1093/petrology/29.2.445).\n")
cat("To distinguish these minerals from the original set of mineral data in CHNOSZ (based on the compliation of [Helgeson et al., 1978](http://www.worldcat.org/oclc/13594862)), the physical states are listed as `cr_Berman`.\n")
cat("The actual data are stored separately, as CSV files in `extdata/Berman/*.csv`.\n")
cat("To see the equations in use, run [<span style='color:blue'>`demo(lambda)`</span>](../demo) to calculate properties of the lambda transition in quartz [@Ber88]; the Berman equations are also used in [<span style='color:blue'>`demo(DEW)`</span>](../demo) and [<span style='color:blue'>`demo(go-IU)`</span>](../demo).<hr>")

## ----reflist, results="asis", echo=FALSE---------------------------------
used <- c(used, filerefs(csvfile))

## ----reflist, results="asis", echo=FALSE---------------------------------
used <- c(used, filerefs(csvfile))

## ----reflist, results="asis", echo=FALSE---------------------------------
used <- c(used, filerefs(csvfile))

## ----reflist, results="asis", echo=FALSE---------------------------------
used <- c(used, filerefs(csvfile))

## ----Optional_Data, results="asis", echo=FALSE---------------------------
cat("These files contain optional data updates that replace and/or may be inconsistent with other entries in the default database. Use e.g. <span style='color:red'>`add.obigt('SUPCRTBL')`</span> to load the data.\n\n")

## ----DEW_aq, results="asis", echo=FALSE----------------------------------
cat("The [Deep Earth Water](http://www.dewcommunity.org/) (DEW) model extends the applicability of the revised HKF equations of state to 60 kbar. Accuracy of the thermodynamic calculations at these conditions is improved by revised correlations for the <i>a</i><sub>1</sub> HKF parameter, as described by [Sverjensky et al., 2014](https://doi.org/10.1016/j.gca.2013.12.019). The data here were taken from the May 2017 version of the DEW spreadsheet ([Dew Model, 2017](http://www.dewcommunity.org/resources.html)). The following species are present in the spreadsheet, but are not listed in `DEW_aq.csv` because the parameters are unchanged from the default database in CHNOSZ: B(OH)<sub>3</sub>, Br<sup>-</sup>, Ca<sup>+2</sup>, Cl<sup>-</sup>, Cs<sup>+</sup>, F<sup>-</sup>, H<sup>+</sup>, H<sub>2</sub>, He, I<sup>-</sup>, K<sup>+</sup>, Kr, Li<sup>+</sup>, Mg<sup>+2</sup>, Na<sup>+</sup>, Ne, O<sub>2</sub>, Rb<sup>+</sup>, Rn.\n\n")
cat("Besides using <span style='color:red'>`add.obigt('DEW')`</span> to load these data, you should also run <span style='color:red'>`water('DEW')`</span> to activate the DEW equations in CHNOSZ. See [<span style='color:blue'>`demo(DEW)`</span>](../demo) for some examples.<hr>")

## ----optused, include=FALSE----------------------------------------------
# initialize the list of used optional data
optused <- character()

## ----optreflist, results="asis", echo=FALSE------------------------------
# run filerefs for optional data sources
optused <- c(optused, filerefs(csvfile))

## ----SUPCRTBL, results="asis", echo=FALSE--------------------------------
cat("<a href=http://www.indiana.edu/~hydrogeo/supcrtbl.html>SUPCRTBL</a> is a modification and data update for the SUPCRT92 package ([Zimmer et al., 2016](https://doi.org/10.1016/j.cageo.2016.02.013)). Data for SiO<sub>2(*aq*)</sub> were updated to reflect the higher observed solubility of quartz compared to the SUPCRT92 dataset, and other aqueous species and minerals relevant to environmental geochemistry were added. The data provided in CHNOSZ were taken from the original references cited below or, where indicated, from `spronsbl.dat` ([downloaded here](http://www.indiana.edu/~hydrogeo/SUPCRTBL_linux.zip); file dated 2016-03-01).\n\n")
cat("NOTE 1: The SUPCRTBL modifications apply the [Holland and Powell (2011)](https://doi.org/10.1111/j.1525-1314.2010.00923.x) equations and dataset for minerals, which are not available in CHNOSZ. Instead, as an alternative to the default dataset of [Helgeson et al. (1978)](http://www.worldcat.org/oclc/13594862), CHNOSZ offers the dataset of [Berman (1988)](https://doi.org/10.1093/petrology/29.2.445) (see the **Solids** / **Berman** section of this vignette).\n")
cat("NOTE 2: The minerals listed below are represented in the compilation of Zimmer et al. (2016) by constant volume and, where available, a 4-term heat capacity equation that, unlike the complete Holland and Powell formulation, **is** compatible with CHNOSZ.\n")
cat("NOTE 3: Although Zimmer et al. (2016) remark that properties of HSiO<sub>3</sub><sup>-</sup> were recalculated, the values in `spronsbl.dat` are identical to those in [Sverjensky et al. (1997)](https://doi.org/10.1016/S0016-7037(97)00009-4). Those data are not included here (they are part of the default database of CHNOSZ).\n\n")
cat("Run [<span style='color:blue'>`demo(go-IU)`</span>](../demo) for some examples.<hr>")

## ----optreflist, results="asis", echo=FALSE------------------------------
# run filerefs for optional data sources
optused <- c(optused, filerefs(csvfile))

## ----H2O_aq, results="asis", echo=FALSE----------------------------------
cat('This file contains H<sub>2</sub>O, *e*<sup>-</sup>, and H<sup>+</sup>.\n')
cat('The properties of H<sub>2</sub>O are listed as NA; CHNOSZ calculates its properties using a Fortran subroutine taken from SUPRCT92 ([Johnson et al., 1992](https://doi.org/10.1016/0098-3004(92)90029-Q)) (default) or using the IAPWS-95 equations ([Wagner and Pruß, 2002](https://doi.org/10.1063/1.1461829)) or the [Deep Earth Water](http://www.dewcommunity.org/) (DEW) model ([Sverjensky et al., 2014](https://doi.org/10.1016/j.gca.2013.12.019)).\n\n')
cat('By convention, the standard Gibbs energy of formation, entropy, and heat capacity of the aqueous proton (H<sup>+</sup>) are 0 at all *T* and *P* ([e.g. Cox et al., 1989](http://www.worldcat.org/oclc/18559968)).\n')
cat('The formation reaction of the proton can be expressed as &frac12;H<sub>2,(*g*)</sub> + Z = H<sup>+</sup>, where Z is the "element" of positive charge.\n')
cat('Because the conventional standard Gibbs energy of this reaction is 0 at all *T*, the standard entropy of the reaction is also constrained to be zero (cf. [Puigdomenech et al., 1997](http://www.oecd-nea.org/dbtdb/pubs/book-pdf/427-494.pdf)).\n')
cat('Therefore, the "element" of positive charge (Z) has zero thermodynamic properties except for an entropy, *S*°<sub>*T*<sub>r</sub></sub>, that is negative one-half that of H<sub>2,(*g*)</sub>.\n')
cat('The standard entropy of the aqueous electron, which is a solely a pseudospecies defined by *e*<sup>-</sup> = -Z, is opposite that of Z.<span style="color:red">**</span>\n\n')
cat('Despite these considerations, the final column of the thermodynamic database (`thermo$obigt`) lists a charge of "0" for both the aqueous proton and electron.\n')
cat('Data in this this column are used in CHNOSZ only to specify the charge that is input to the "*g*-function" ([Tanger and Helgeson, 1988](https://doi.org/10.2475/ajs.288.1.19); [Shock and Helgeson, 1988](https://doi.org/10.1016/0016-7037(88)90181-0)).\n')
cat('Setting it to zero prevents activation of the *g*-function, which would result in non-zero contributions to thermodynamic properties, conflicting with the conventions mentioned above.\n')
cat('All other calculations in CHNOSZ obtain the elemental makeup, including the correct charge for the species, by parsing the chemical formulas stored in the database.<span style="color:red">^^</span>\n\n')
cat('<span style="color:red">**</span>Likewise, [GEM-Selektor](http://gems.web.psi.ch/) defines "independent components" to be stoichiometric units usually consisting of elements and charge; the latter, [which is named Zz](http://gems.web.psi.ch/tests/TestNaCl-dep.html) and has a standard molal entropy of -65.34 J/mol/K and heat capacity of -14.418 J/mol/K (negative one-half those of gaseous hydrogen), is negated in the formula of the fictive "aqueous electron" ([Kulik, 2006](https://doi.org/10.1016/j.chemgeo.2005.08.014)).\n\n')
cat('<span style="color:red">^^</span> Relatedly, charged amino acid sidechain groups have a charge that is tabulated as zero, because other values would be incompatible with group additivity of cations and anions (which have derivatives of the omega parameter (&omega;) in the revised HKF equations of state that are not opposites of each other) to give a neutral species (for which the derivatives of &omega; are taken to be zero) (cf. [Dick et al., 2006](https://doi.org/10.5194/bg-3-311-2006)).\n')

## ----used2, include=FALSE------------------------------------------------
# initialize the list of used species
used2 <- character()

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----inorganic_aq, results="asis", echo=FALSE----------------------------
cat("ZnCl<sub>4</sub><sup>-2</sup> was present in sprons92.dat but not in slop98.dat or later files, and is not included in CHNOSZ.<hr>")

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----inorganic_cr, results="asis", echo=FALSE----------------------------
cat("Chamosite,7A and witherite were present in sprons92.dat but not in slop98.dat or later files, and are not included in CHNOSZ.\n\n")
cat("The source of parameters used here for goethite is different from that in the slop files ([Shock, 2009](https://doi.org/10.2113/gsecongeo.104.8.1235)).<hr>")

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----Berman_cr, results="asis", echo=FALSE-------------------------------
cat("This file gives the identifiying information for minerals whose properties are calculated using the formulation of [Berman (1988)](https://doi.org/10.1093/petrology/29.2.445).\n")
cat("To distinguish these minerals from the original set of mineral data in CHNOSZ (based on the compliation of [Helgeson et al., 1978](http://www.worldcat.org/oclc/13594862)), the physical states are listed as `cr_Berman`.\n")
cat("The actual data are stored separately, as CSV files in `extdata/Berman/*.csv`.\n")
cat("To see the equations in use, run [<span style='color:blue'>`demo(lambda)`</span>](../demo) to calculate properties of the lambda transition in quartz [@Ber88]; the Berman equations are also used in [<span style='color:blue'>`demo(DEW)`</span>](../demo) and [<span style='color:blue'>`demo(go-IU)`</span>](../demo).<hr>")

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----Optional_Data, results="asis", echo=FALSE---------------------------
cat("These files contain optional data updates that replace and/or may be inconsistent with other entries in the default database. Use e.g. <span style='color:red'>`add.obigt('SUPCRTBL')`</span> to load the data.\n\n")

## ----DEW_aq, results="asis", echo=FALSE----------------------------------
cat("The [Deep Earth Water](http://www.dewcommunity.org/) (DEW) model extends the applicability of the revised HKF equations of state to 60 kbar. Accuracy of the thermodynamic calculations at these conditions is improved by revised correlations for the <i>a</i><sub>1</sub> HKF parameter, as described by [Sverjensky et al., 2014](https://doi.org/10.1016/j.gca.2013.12.019). The data here were taken from the May 2017 version of the DEW spreadsheet ([Dew Model, 2017](http://www.dewcommunity.org/resources.html)). The following species are present in the spreadsheet, but are not listed in `DEW_aq.csv` because the parameters are unchanged from the default database in CHNOSZ: B(OH)<sub>3</sub>, Br<sup>-</sup>, Ca<sup>+2</sup>, Cl<sup>-</sup>, Cs<sup>+</sup>, F<sup>-</sup>, H<sup>+</sup>, H<sub>2</sub>, He, I<sup>-</sup>, K<sup>+</sup>, Kr, Li<sup>+</sup>, Mg<sup>+2</sup>, Na<sup>+</sup>, Ne, O<sub>2</sub>, Rb<sup>+</sup>, Rn.\n\n")
cat("Besides using <span style='color:red'>`add.obigt('DEW')`</span> to load these data, you should also run <span style='color:red'>`water('DEW')`</span> to activate the DEW equations in CHNOSZ. See [<span style='color:blue'>`demo(DEW)`</span>](../demo) for some examples.<hr>")

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----SUPCRTBL, results="asis", echo=FALSE--------------------------------
cat("<a href=http://www.indiana.edu/~hydrogeo/supcrtbl.html>SUPCRTBL</a> is a modification and data update for the SUPCRT92 package ([Zimmer et al., 2016](https://doi.org/10.1016/j.cageo.2016.02.013)). Data for SiO<sub>2(*aq*)</sub> were updated to reflect the higher observed solubility of quartz compared to the SUPCRT92 dataset, and other aqueous species and minerals relevant to environmental geochemistry were added. The data provided in CHNOSZ were taken from the original references cited below or, where indicated, from `spronsbl.dat` ([downloaded here](http://www.indiana.edu/~hydrogeo/SUPCRTBL_linux.zip); file dated 2016-03-01).\n\n")
cat("NOTE 1: The SUPCRTBL modifications apply the [Holland and Powell (2011)](https://doi.org/10.1111/j.1525-1314.2010.00923.x) equations and dataset for minerals, which are not available in CHNOSZ. Instead, as an alternative to the default dataset of [Helgeson et al. (1978)](http://www.worldcat.org/oclc/13594862), CHNOSZ offers the dataset of [Berman (1988)](https://doi.org/10.1093/petrology/29.2.445) (see the **Solids** / **Berman** section of this vignette).\n")
cat("NOTE 2: The minerals listed below are represented in the compilation of Zimmer et al. (2016) by constant volume and, where available, a 4-term heat capacity equation that, unlike the complete Holland and Powell formulation, **is** compatible with CHNOSZ.\n")
cat("NOTE 3: Although Zimmer et al. (2016) remark that properties of HSiO<sub>3</sub><sup>-</sup> were recalculated, the values in `spronsbl.dat` are identical to those in [Sverjensky et al. (1997)](https://doi.org/10.1016/S0016-7037(97)00009-4). Those data are not included here (they are part of the default database of CHNOSZ).\n\n")
cat("Run [<span style='color:blue'>`demo(go-IU)`</span>](../demo) for some examples.<hr>")

## ----reflist2, results="asis", echo=FALSE--------------------------------
used2 <- c(used2, filerefs(csvfile))

## ----check_used_used2, results="asis", echo=FALSE------------------------
if(length(used) + length(optused) != length(used2)) cat(paste0("**WARNING: Tabbed list has ", length(used) + length(optused), " species but 'All at once list' has ", length(used2),".**\n\n"))

