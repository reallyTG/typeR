library(define)


### Name: define
### Title: Define objects per FDA guidance.
### Aliases: define define.character

### ** Examples

library(spec)                   # read and write data specifications
library(latexpdf)               # make dummy logo for pdf
library(encode)                 # encode factor levels for spec file

dir <- tempdir()                # a place to experiment
dir <- gsub('\\\\','/',dir)     # clean up windows path
outdir <- file.path(dir,'out')  # where to put the define archive
csv <- file.path(dir,'theoph.csv')    # path to data
script <- file.path(dir,'theoph.R')   # path to script making data
spec <- file.path(dir,'theoph.spec')  # path to data specification

# make dummy logo
## Not run: 
##D as.pdf('{\\huge \\em Pharma, Inc.}',wide = 50, long = 8,stem = 'logo', dir = dir)
## End(Not run)
# browseURL(system.file(package = 'define', 'logo.pdf')) # cached
logo <- system.file(package = 'define', 'logo.pdf')     # path to dummy logo

# make data more interesting
Theoph$renal <- 0

# create script
code <- "write.csv(x = Theoph,file = csv,row.names = FALSE,quote = FALSE)"
writeLines(code,script)

# 'run' the script
eval(parse(text = code))

# make data specification
s <- specification(Theoph)
renalcat <- c(
 'GFR >= 90 mL/min/1.73m^2',
 '60 <= GFR < 90 mL/min/1.73m^2',
 '45 <= GFR < 60 mL/min/1.73m^2',
 '30 <= GFR < 45 mL/min/1.73m^2',
 'GFR < 30 mL/min/1.73m^2'
)
codes <- encode(0:4, renalcat)
codes
s$guide[s$column == 'renal'] <- codes

write.spec(s,spec)

file.exists(csv)
file.exists(spec)
define(c(theoph = csv),stem = 'minimal',dir = outdir, clean=FALSE)
# browseURL(file.path(outdir,'minimal.pdf'))
# browseURL(system.file(package = 'define', 'minimal.pdf')) # cached

## Not run: 
##D define(
##D   x = c(
##D     theodat = csv,
##D     theoprg = script
##D    ),
##D   subdir = c(
##D     'm5/datasets/analysis/datasets',
##D     'm5/datasets/analysis/programs'
##D   ),
##D   description = c(
##D     'Theophylline PK Dataset',
##D     'Theophylline PK Script'
##D   ),
##D   title = 'Pharmacokinetics of Theophylline',
##D   short = 'Theophylline PK',
##D   protocol = 'Protocol tpk-001',
##D   sponsor = 'Pharma, Inc.',
##D   program = 'Theophylline',
##D   author = 'define package for R',
##D   logo = logo,
##D   logoscale = 2,
##D   clear = FALSE,
##D   dir = outdir
##D )
##D # browseURL(file.path(outdir,'define.pdf'))
## End(Not run)
# browseURL(system.file(package = 'define','define.pdf')) # cached
# browseURL(system.file(package = 'define','poster.pdf')) # earlier work

# Alternatively, supply aesthetics by position:
## Not run: 
##D define(
##D   x = c(
##D     theodat = csv,
##D     theoprg = script
##D    ),
##D   subdir = c(
##D     'm5/datasets/analysis/datasets',
##D     'm5/datasets/analysis/programs'
##D   ),
##D   description = c(
##D     'Theophylline PK Dataset',
##D     'Theophylline PK Script'
##D   ),
##D   title = 'Pharmacokinetics of Theophylline',
##D   lhead1 = 'Theophylline PK',
##D   lhead2 = 'Protocol tpk-001',
##D   rhead1 = 'Pharma, Inc.',
##D   rhead2 = 'Theophylline',
##D   lfoot = 'define package for R',
##D   rfoot = '\\mydate \\today',
##D   logo = logo,
##D   logoscale = 2,
##D   clear = FALSE,
##D   dir = outdir
##D )
## End(Not run)

# Tags for elements of x can be given explicitly rather than as names:
## Not run: 
##D define(
##D   x   = c(csv, script),
##D   tag = c('theodat','theoprg'),
##D   subdir = c(
##D     'm5/datasets/analysis/datasets',
##D     'm5/datasets/analysis/programs'
##D   ),
##D   description = c(
##D     'Theophylline PK Dataset',
##D     'Theophylline PK Script'
##D   ),
##D   title = 'Pharmacokinetics of Theophylline',
##D   lhead1 = 'Theophylline PK',
##D   lhead2 = 'Protocol tpk-001',
##D   rhead1 = 'Pharma, Inc.',
##D   rhead2 = 'Theophylline',
##D   lfoot = 'define package for R',
##D   rfoot = '\\mydate \\today',
##D   logo = logo,
##D   logoscale = 2,
##D   clear = FALSE,
##D   dir = outdir
##D )
## End(Not run)

# If the title is short, no need to supply a short version.
# Most arguments have suitable defaults. But be sure to
# supply tags, or names for elements of x.
## Not run: 
##D define(
##D   x = c(
##D     theodat = csv,
##D     theoprg = script
##D    ),
##D   description = c(
##D     'Theophylline PK Dataset',
##D     'Theophylline PK Script'
##D   ),
##D   title = 'Theophylline PK',
##D   dir = outdir
##D )
## End(Not run)





