## ---- eval=FALSE---------------------------------------------------------
#  > library(RcppAPT)
#  > library(data.table)
#  > rd <- reverseDepends("r-base-core")         # 516 x 2
#  > rd <- rd[grepl("^r-", rd[,1]), ]            # 489 x 2
#  > rd <- rd[order(rd[,2]), ]
#  > setDT(rd)

## ---- eval=FALSE---------------------------------------------------------
#  > rd
#  > rd
#               package version
#    1:       r-doc-pdf
#    2:      r-doc-info
#    3:      r-doc-html
#    4:     r-base-html
#    5:     r-other-rot
#   ---
#  485: r-base-core-dbg 3.4.1-2
#  486:          r-base 3.4.1-2
#  487:     r-cran-mgcv 3.4.1-2
#  488:     r-cran-boot 3.4.1-2
#  489:      r-cran-car 3.4.1-2
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > rd[ version=="3.0.0~20130330-1", version := "3.0.0.20130330-1"]
#  > rd[ version=="3.2.4-revised-1", version := "3.2.4.1-1"]
#  > rd[version!="", oldVersion := version  <=  package_version("3.3.3-1")]
#  > rd[ is.na(oldVersion), oldVersion := FALSE]
#  > rd[ !grepl("r-(doc|base)", package), ]
#               package          version oldVersion
#    1:     r-other-rot                       FALSE
#    2: r-cran-epitools          3.0.0-2       TRUE
#    3: r-cran-combinat          3.0.0-2       TRUE
#    4:    r-cran-gmaps 3.0.0.20130330-1       TRUE
#    5:      r-cran-wdi          3.0.1-6       TRUE
#   ---
#  478:   r-recommended          3.4.1-2      FALSE
#  479:       r-mathlib          3.4.1-2      FALSE
#  480:     r-cran-mgcv          3.4.1-2      FALSE
#  481:     r-cran-boot          3.4.1-2      FALSE
#  482:      r-cran-car          3.4.1-2      FALSE

## ---- eval=FALSE---------------------------------------------------------
#  > rd[ version=="", skip:=TRUE ]
#  > rd[ is.na(skip), skip:=FALSE]
#  > rd[ skip==FALSE, ]
#               package          version oldVersion  skip
#    1: r-cran-epitools          3.0.0-2       TRUE FALSE
#    2: r-cran-combinat          3.0.0-2       TRUE FALSE
#    3:    r-cran-gmaps 3.0.0.20130330-1       TRUE FALSE
#    4:      r-cran-wdi          3.0.1-6       TRUE FALSE
#    5:   r-cran-bitops          3.0.1-6       TRUE FALSE
#   ---
#  480: r-base-core-dbg          3.4.1-2      FALSE FALSE
#  481:          r-base          3.4.1-2      FALSE FALSE
#  482:     r-cran-mgcv          3.4.1-2      FALSE FALSE
#  483:     r-cran-boot          3.4.1-2      FALSE FALSE
#  484:      r-cran-car          3.4.1-2      FALSE FALSE
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > regexp <- paste(paste0("^", rd[skip==FALSE, package], "$"), collapse="|")
#  > dep <- getDepends(regexp)
#  > setDT(dep)
#  > dep
#                    srcpkg              deppkg cmpop          version
#     1:  r-bioc-hypergraph         r-base-core     2 3.3.1.20161024-1
#     2:  r-bioc-hypergraph             r-api-3     0           (null)
#     3:  r-bioc-hypergraph        r-bioc-graph     0           (null)
#     4:  r-bioc-hypergraph r-bioc-biocgenerics     0           (null)
#     5:  r-bioc-hypergraph        r-cran-runit     0           (null)
#    ---
#  3744: r-cran-viridislite             r-api-3     0           (null)
#  3745:      r-cran-xtable         r-base-core     2          3.2.5-1
#  3746:      r-cran-xtable             r-api-3     0           (null)
#  3747:   r-cran-pkgkitten         r-base-core     2          3.3.2-1
#  3748:   r-cran-pkgkitten             r-api-3     0           (null)
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > comp <- dep[deppkg=="libc6"]   # 242
#  > comp
#                   srcpkg deppkg cmpop version isCompiled
#    1:  r-bioc-makecdfenv  libc6     2     2.4       TRUE
#    2:       r-cran-bio3d  libc6     2    2.14       TRUE
#    3:   r-bioc-rsamtools  libc6     2    2.15       TRUE
#    4:     r-cran-foreign  libc6     2    2.14       TRUE
#    5:    r-bioc-multtest  libc6     2    2.14       TRUE
#   ---
#  238:     r-cran-nleqslv  libc6     2     2.4       TRUE
#  239: r-other-amsmercury  libc6     2    2.14       TRUE
#  240:         r-cran-gnm  libc6     2     2.4       TRUE
#  241:         r-cran-gsl  libc6     2     2.4       TRUE
#  242:         r-cran-gss  libc6     2     2.4       TRUE
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > setkey(comp, srcpkg)
#  > setkey(rd, package)
#  > all <- rd[comp[, c(1,5)]]   # inner join (by default on columns with keys)
#  > all[order(version),]
#                        package version oldVersion  skip isCompiled
#    1:            r-cran-bitops 3.0.1-6       TRUE FALSE       TRUE
#    2:               r-cran-mnp 3.0.2-1       TRUE FALSE       TRUE
#    3: r-other-mott-happy.hbrem 3.0.2-1       TRUE FALSE       TRUE
#    4:             r-cran-amore 3.1.0-1       TRUE FALSE       TRUE
#    5:              r-cran-deal 3.1.0-1       TRUE FALSE       TRUE
#   ---
#  238:              r-cran-rcpp 3.4.1-2      FALSE FALSE       TRUE
#  239:            r-cran-rmysql 3.4.1-2      FALSE FALSE       TRUE
#  240:         r-cran-rsymphony 3.4.1-2      FALSE FALSE       TRUE
#  241:               r-cran-ttr 3.4.1-2      FALSE FALSE       TRUE
#  242:                r-mathlib 3.4.1-2      FALSE FALSE       TRUE
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > all[oldVersion==TRUE,][order(version),]    # 167
#                        package version oldVersion  skip isCompiled
#    1:            r-cran-bitops 3.0.1-6       TRUE FALSE       TRUE
#    2:               r-cran-mnp 3.0.2-1       TRUE FALSE       TRUE
#    3: r-other-mott-happy.hbrem 3.0.2-1       TRUE FALSE       TRUE
#    4:             r-cran-amore 3.1.0-1       TRUE FALSE       TRUE
#    5:              r-cran-deal 3.1.0-1       TRUE FALSE       TRUE
#   ---
#  163:           r-cran-rcppgsl 3.3.3-1       TRUE FALSE       TRUE
#  164:             r-cran-rodbc 3.3.3-1       TRUE FALSE       TRUE
#  165:         r-cran-snowballc 3.3.3-1       TRUE FALSE       TRUE
#  166:                r-cran-v8 3.3.3-1       TRUE FALSE       TRUE
#  167:               r-cran-zoo 3.3.3-1       TRUE FALSE       TRUE
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > all[, cran:=grepl("^r-cran", package) ]
#  > all[, bioc:=grepl("^r-bioc", package) ]
#  > all[bioc==TRUE & oldVersion==TRUE,]                # 17 BioC
#                    package          version oldVersion  skip isCompiled  cran bioc
#   1:           r-bioc-affy 3.3.1.20161024-1       TRUE FALSE       TRUE FALSE TRUE
#   2:         r-bioc-affyio 3.3.1.20161024-1       TRUE FALSE       TRUE FALSE TRUE
#   3:        r-bioc-biobase 3.3.1.20161024-1       TRUE FALSE       TRUE FALSE TRUE
#   4:     r-bioc-biovizbase          3.3.2-1       TRUE FALSE       TRUE FALSE TRUE
#   5:         r-bioc-deseq2          3.3.2-1       TRUE FALSE       TRUE FALSE TRUE
#   6:        r-bioc-dnacopy 3.3.1.20161024-1       TRUE FALSE       TRUE FALSE TRUE
#   7:          r-bioc-edger          3.3.0-2       TRUE FALSE       TRUE FALSE TRUE
#   8:     r-bioc-genefilter          3.3.2-1       TRUE FALSE       TRUE FALSE TRUE
#   9:          r-bioc-graph 3.3.1.20161024-1       TRUE FALSE       TRUE FALSE TRUE
#  10:     r-bioc-hilbertvis 3.3.1.20161024-1       TRUE FALSE       TRUE FALSE TRUE
#  11:          r-bioc-limma          3.3.2-1       TRUE FALSE       TRUE FALSE TRUE
#  12:     r-bioc-makecdfenv 3.3.1.20161024-1       TRUE FALSE       TRUE FALSE TRUE
#  13:       r-bioc-multtest 3.3.1.20161024-1       TRUE FALSE       TRUE FALSE TRUE
#  14: r-bioc-preprocesscore 3.3.1.20161024-1       TRUE FALSE       TRUE FALSE TRUE
#  15:           r-bioc-rbgl          3.3.2-1       TRUE FALSE       TRUE FALSE TRUE
#  16:    r-bioc-rtracklayer          3.3.2-1       TRUE FALSE       TRUE FALSE TRUE
#  17:       r-bioc-snpstats 3.3.1.20161024-1       TRUE FALSE       TRUE FALSE TRUE
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > all[bioc!=TRUE & cran!=TRUE & oldVersion==TRUE,]   # 3 other
#                      package version oldVersion  skip isCompiled  cran  bioc
#  1:       r-other-amsmercury 3.3.2-1       TRUE FALSE       TRUE FALSE FALSE
#  2:          r-other-iwrlars 3.3.2-1       TRUE FALSE       TRUE FALSE FALSE
#  3: r-other-mott-happy.hbrem 3.0.2-1       TRUE FALSE       TRUE FALSE FALSE
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > cand <- all[ cran==TRUE & oldVersion==TRUE, ]   # 147
#  > cand
#               package version oldVersion  skip isCompiled cran  bioc
#    1:     r-cran-ade4 3.3.2-1       TRUE FALSE       TRUE TRUE FALSE
#    2: r-cran-adegenet 3.3.1-1       TRUE FALSE       TRUE TRUE FALSE
#    3: r-cran-adephylo 3.3.2-1       TRUE FALSE       TRUE TRUE FALSE
#    4:   r-cran-amelia 3.2.3-1       TRUE FALSE       TRUE TRUE FALSE
#    5:    r-cran-amore 3.1.0-1       TRUE FALSE       TRUE TRUE FALSE
#   ---
#  143:    r-cran-vegan 3.3.2-1       TRUE FALSE       TRUE TRUE FALSE
#  144:     r-cran-vgam 3.3.2-1       TRUE FALSE       TRUE TRUE FALSE
#  145:     r-cran-xml2 3.3.2-1       TRUE FALSE       TRUE TRUE FALSE
#  146:     r-cran-yaml 3.3.2-1       TRUE FALSE       TRUE TRUE FALSE
#  147:      r-cran-zoo 3.3.3-1       TRUE FALSE       TRUE TRUE FALSE
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > db <- tools::CRAN_package_db()   # CRAN pkge info: N rows x 65 cols
#  > setDT(db)
#  > db[, package:=paste0("r-cran-", tolower(Package))]
#  > setkey(db, package)              # key on package field
#  > foo <- db[ cand ]                # inner join
#  > foo[, .(package, Package, Version, NeedsCompilation, oldVersion, skip)]
#               package  Package Version NeedsCompilation oldVersion  skip
#    1:     r-cran-ade4     ade4   1.7-6              yes       TRUE FALSE
#    2: r-cran-adegenet adegenet   2.0.1              yes       TRUE FALSE
#    3: r-cran-adephylo adephylo  1.1-10              yes       TRUE FALSE
#    4:   r-cran-amelia   Amelia   1.7.4              yes       TRUE FALSE
#    5:    r-cran-amore    AMORE  0.2-15              yes       TRUE FALSE
#   ---
#  143:    r-cran-vegan    vegan   2.4-3              yes       TRUE FALSE
#  144:     r-cran-vgam     VGAM   1.0-3              yes       TRUE FALSE
#  145:     r-cran-xml2     xml2   1.1.1              yes       TRUE FALSE
#  146:     r-cran-yaml     yaml  2.1.14              yes       TRUE FALSE
#  147:      r-cran-zoo      zoo   1.8-0              yes       TRUE FALSE
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > saveRDS(foo[, .(package, Package, Version, NeedsCompilation, oldVersion, skip)], file="debpackages.rds")

## ---- eval=FALSE---------------------------------------------------------
#  deb <- readRDS("~/debpackages.rds")
#  for (i in 1:nrow(deb)) {
#      deb[i, "dotCorFortran"] <- if (is.na(deb[i, "Package"])) NA
#                                 else system(paste0("egrep -r -q \"\\.(C|Fortran)\\(\" ", deb[i, "Package"], "/R/*"))==0
#      deb[i, "hasRegistration"] <- if (is.na(deb[i, "Package"])) NA
#                                 else system(paste0("egrep -r -q \"R_registerRoutines\\(\" ", deb[i, "Package"], "/src/*"))==0
#  }
#  saveRDS(deb, "~/debpackagesout.rds")

## ---- eval=FALSE---------------------------------------------------------
#  > deb <- readRDS("debpackagesout.rds")
#  > setDT(deb)
#  > deb[ is.na(dotCorFortran) |(dotCorFortran & hasRegistration), 1:3]
#                       package           Package  Version
#   1:              r-cran-ade4              ade4    1.7-6
#   2:            r-cran-bayesm            bayesm  3.1-0.1
#   3:     r-cran-blockmodeling     blockmodeling    0.1.9
#   4:             r-cran-brglm             brglm    0.6.1
#   5:             r-cran-caret             caret   6.0-76
#   6:              r-cran-coin              coin    1.2-1
#   7:          r-cran-contfrac          contfrac   1.1-11
#   8:        r-cran-data.table        data.table   1.10.4
#   9:            r-cran-deldir            deldir   0.1-14
#  10:           r-cran-desolve           deSolve     1.20
#  11:               r-cran-eco               eco    4.0-1
#  12:              r-cran-expm              expm  0.999-2
#  13:            r-cran-fields            fields      9.0
#  14:               r-cran-gam               gam   1.14-4
#  15:            r-cran-glmnet            glmnet   2.0-10
#  16:           r-cran-goftest           goftest    1.1-1
#  17:              r-cran-hdf5                NA       NA
#  18:            r-cran-igraph            igraph    1.1.2
#  19:           r-cran-mapproj           mapproj    1.2-5
#  20:              r-cran-maps              maps    3.2.0
#  21:          r-cran-maptools          maptools    0.9-2
#  22:              r-cran-mcmc              mcmc    0.9-5
#  23:          r-cran-mcmcpack          MCMCpack    1.4-0
#  24:      r-cran-medadherence                NA       NA
#  25:          r-cran-mixtools          mixtools    1.1.0
#  26:               r-cran-mnp               MNP    3.0-2
#  27:             r-cran-ncdf4             ncdf4     1.16
#  28:          r-cran-phangorn          phangorn    2.2.0
#  29:         r-cran-phylobase         phylobase    0.8.4
#  30:               r-cran-qtl               qtl   1.41-6
#  31:      r-cran-randomfields      RandomFields   3.1.50
#  32: r-cran-randomfieldsutils RandomFieldsUtils   0.3.25
#  33:             r-cran-rcurl             RCurl 1.95-4.8
#  34:         r-cran-rniftilib                NA       NA
#  35:                r-cran-sp                sp    1.2-5
#  36:              r-cran-spam              spam    2.1-1
#  37:          r-cran-spatstat          spatstat   1.51-0
#  38:             r-cran-spdep             spdep   0.6-13
#  39:      r-cran-surveillance      surveillance   1.14.0
#  40:         r-cran-treescape                NA       NA
#  41:             r-cran-vegan             vegan    2.4-3
#  42:              r-cran-vgam              VGAM    1.0-4
#                       package           Package  Version
#  >

## ---- eval=FALSE---------------------------------------------------------
#  pkgs <- rbind(all[bioc!=TRUE & cran!=TRUE & oldVersion==TRUE, 1],
#                all[bioc==TRUE & oldVersion==TRUE, 1])[[1]]
#  
#  dir.create("/tmp/scratch")
#  setwd("/tmp/scratch")
#  
#  cat("deb-src http://deb.debian.org/debian unstable main\n",
#      file="/etc/apt/sources.list", append=TRUE)
#  system("apt-get update")
#  
#  for (p in pkgs) system(paste("apt-get source", p))
#  
#  df <- data.frame(package=pkgs, stringsAsFactors=FALSE)
#  for (i in 1:nrow(df)) {
#      p <- df[i, 1]
#      df[i, "dotCorFortran"] <- system(paste0("egrep -r -q \"\\.(C|Fortran)\\(\" ", p, "*/R/*"))==0
#      df[i, "hasRegistration"] <- system(paste0("egrep -r -q \"R_registerRoutines\\(\" ", p, "*/src/*"))==0
#  }
#  
#  setDT(df)

## ---- eval=FALSE---------------------------------------------------------
#  > df[dotCorFortran & hasRegistration, 1]
#                       pkg
#  1:           r-bioc-affy
#  2:          r-bioc-edger
#  3:     r-bioc-genefilter
#  4: r-bioc-preprocesscore
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > nmu <- deb[ is.na(dotCorFortran) | (dotCorFortran & hasRegistration), 1] #42
#  > oth <- df[dotCorFortran & hasRegistration, 1]
#  >
#  > nmu <- rbind(nmu, oth)  ## 46
#  > nmu
#                       package
#   1:              r-cran-ade4
#   2:            r-cran-bayesm
#   3:     r-cran-blockmodeling
#   4:             r-cran-brglm
#   5:             r-cran-caret
#   6:              r-cran-coin
#   7:          r-cran-contfrac
#   8:        r-cran-data.table
#   9:            r-cran-deldir
#  10:           r-cran-desolve
#  11:               r-cran-eco
#  12:              r-cran-expm
#  13:            r-cran-fields
#  14:               r-cran-gam
#  15:            r-cran-glmnet
#  16:           r-cran-goftest
#  17:              r-cran-hdf5
#  18:            r-cran-igraph
#  19:           r-cran-mapproj
#  20:              r-cran-maps
#  21:          r-cran-maptools
#  22:              r-cran-mcmc
#  23:          r-cran-mcmcpack
#  24:      r-cran-medadherence
#  25:          r-cran-mixtools
#  26:               r-cran-mnp
#  27:             r-cran-ncdf4
#  28:          r-cran-phangorn
#  29:         r-cran-phylobase
#  30:               r-cran-qtl
#  31:      r-cran-randomfields
#  32: r-cran-randomfieldsutils
#  33:             r-cran-rcurl
#  34:         r-cran-rniftilib
#  35:                r-cran-sp
#  36:              r-cran-spam
#  37:          r-cran-spatstat
#  38:             r-cran-spdep
#  39:      r-cran-surveillance
#  40:         r-cran-treescape
#  41:             r-cran-vegan
#  42:              r-cran-vgam
#  43:              r-bioc-affy
#  44:             r-bioc-edger
#  45:        r-bioc-genefilter
#  46:    r-bioc-preprocesscore
#                       package
#  >
#  >

## ---- eval=FALSE---------------------------------------------------------
#  > regexp <- paste(paste0("^", nmu[[1]], "$"), collapse="|")
#  >
#  > res <- getPackages(regexp)
#  > res
#                      Package         Version
#  1              r-bioc-edger   3.14.0+dfsg-1
#  2               r-cran-coin         1.1-3-1
#  3                r-cran-mnp         2.6-4-1
#  4             r-cran-fields          8.10-1
#  5            r-cran-desolve          1.14-1
#  6             r-cran-deldir        0.1-12-1
#  7          r-cran-rniftilib    0.0-35.r79-2
#  8         r-cran-data.table        1.10.0-1
#  9                r-cran-qtl        1.40-8-1
#  10    r-bioc-preprocesscore        1.36.0-1
#  11          r-cran-contfrac        1.1-10-1
#  12            r-cran-glmnet         2.0-5-1
#  13                r-cran-sp       1:1.2-4-1
#  14             r-cran-brglm         0.5-9-1
#  15              r-bioc-affy        1.52.0-1
#  16             r-cran-ncdf4       1.15-1+b2
#  17         r-cran-treescape       1.10.18-6
#  18           r-cran-mapproj         1.2-4-1
#  19     r-cran-blockmodeling         0.1.8-1
#  20              r-cran-hdf5     1.6.10-4+b1
#  21              r-cran-ade4         1.7-5-1
#  22              r-cran-vgam         1.0-3-1
#  23          r-cran-mixtools         1.0.4-1
#  24         r-cran-phylobase         0.8.2-1
#  25              r-cran-spam         1.4-0-1
#  26      r-cran-medadherence          1.03-2
#  27      r-cran-surveillance        1.13.0-1
#  28 r-cran-randomfieldsutils        0.3.15-1
#  29             r-cran-rcurl      1.95-4.8-2
#  30          r-cran-mcmcpack         1.3-8-1
#  31          r-cran-spatstat        1.48-0-1
#  32             r-cran-vegan         2.4-2-1
#  33            r-cran-bayesm         3.0-2-2
#  34              r-cran-expm       0.999-0-1
#  35          r-cran-phangorn         2.1.1-1
#  36          r-cran-maptools 1:0.8-41+dfsg-1
#  37             r-cran-caret  6.0-73+dfsg1-1
#  38           r-cran-goftest         1.0-3-1
#  39            r-cran-igraph         1.0.1-1
#  40              r-cran-maps         3.1.1-1
#  41               r-cran-eco         3.1-7-1
#  42      r-cran-randomfields        3.1.36-1
#  43        r-bioc-genefilter        1.56.0-1
#  44              r-cran-mcmc         0.9-4-2
#  45             r-cran-spdep         0.6-9-1
#  46               r-cran-gam          1.14-1
#  >

## ---- eval=FALSE---------------------------------------------------------
#  >
#  > for (i in 1:nrow(res))
#  +     cat("nmu", paste(res[i,], collapse="_"), ". ANY . -m 'Rebuild against R 3.4.*, see #861333'\n")
#  nmu r-bioc-edger_3.14.0+dfsg-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-coin_1.1-3-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-mnp_2.6-4-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-fields_8.10-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-desolve_1.14-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-deldir_0.1-12-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-rniftilib_0.0-35.r79-2 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-data.table_1.10.0-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-qtl_1.40-8-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-bioc-preprocesscore_1.36.0-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-contfrac_1.1-10-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-glmnet_2.0-5-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-sp_1:1.2-4-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-brglm_0.5-9-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-bioc-affy_1.52.0-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-ncdf4_1.15-1+b2 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-treescape_1.10.18-6 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-mapproj_1.2-4-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-blockmodeling_0.1.8-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-hdf5_1.6.10-4+b1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-ade4_1.7-5-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-vgam_1.0-3-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-mixtools_1.0.4-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-phylobase_0.8.2-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-spam_1.4-0-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-medadherence_1.03-2 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-surveillance_1.13.0-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-randomfieldsutils_0.3.15-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-rcurl_1.95-4.8-2 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-mcmcpack_1.3-8-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-spatstat_1.48-0-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-vegan_2.4-2-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-bayesm_3.0-2-2 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-expm_0.999-0-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-phangorn_2.1.1-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-maptools_1:0.8-41+dfsg-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-caret_6.0-73+dfsg1-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-goftest_1.0-3-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-igraph_1.0.1-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-maps_3.1.1-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-eco_3.1-7-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-randomfields_3.1.36-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-bioc-genefilter_1.56.0-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-mcmc_0.9-4-2 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-spdep_0.6-9-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  nmu r-cran-gam_1.14-1 . ANY . -m 'Rebuild against R 3.4.*, see #861333'
#  >

