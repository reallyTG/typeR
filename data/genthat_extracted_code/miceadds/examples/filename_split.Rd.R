library(miceadds)


### Name: filename_split
### Title: Some Functionality for Strings and File Names
### Aliases: filename_split string_extract_part string_to_matrix
###   filename_split_vec

### ** Examples

#############################################################################
# EXAMPLE 1: Demonstration example for filename_split
#############################################################################

# file name
file_name <- "pisa_all_waves_invariant_items_DATA_ITEMS_RENAMED__DESCRIPTIVES__2016-10-12_1000.csv"

# apply function
miceadds::filename_split( file_name )
  ##  $file_name
  ##  [1] "pisa_all_waves_invariant_items_DATA_ITEMS_RENAMED__DESCRIPTIVES__2016-10-12_1000.csv"
  ##  $stem
  ##  [1] "pisa_all_waves_invariant_items_DATA_ITEMS_RENAMED__DESCRIPTIVES"
  ##  $suffix
  ##  [1] "2016-10-12_1000"
  ##  $ext
  ##  [1] "csv"
  ##  $main
  ##  [1] "pisa_all_waves_invariant_items_DATA_ITEMS_RENAMED__DESCRIPTIVES.csv"

#############################################################################
# EXAMPLE 2: Example string_extract_part
#############################################################################

vec <- c("ertu__DES", "ztu__DATA", "guzeuue745_ghshgk34__INFO", "zzu78347834_ghghwuz")

miceadds::string_extract_part( vec=vec, part=1, sep="__" )
miceadds::string_extract_part( vec=vec, part=2, sep="__" )
  ##  > miceadds::string_extract_part( vec=vec, part=1, sep="__" )
  ##  [1] "ertu"                "ztu"                 "guzeuue745_ghshgk34"
  ##  [4] "zzu78347834_ghghwuz"
  ##  > miceadds::string_extract_part( vec=vec, part=2, sep="__" )
  ##  [1] "DES"  "DATA" "INFO" NA

#############################################################################
# EXAMPLE 3: Reading descriptive information from published articles
#############################################################################

## Not run: 
##D data(data.ma08)
##D library(stringr)
##D 
##D #**** reading correlations (I)
##D dat <- data.ma08$mat1
##D miceadds::string_to_matrix(dat, rownames=2, col_elim=c(1,2))
##D 
##D #**** reading correlations including some processing (II)
##D dat0 <- data.ma08$mat2
##D dat <- dat0[1:14]
##D 
##D # substitute "*"
##D dat <- gsub("*", "", dat, fixed=TRUE )
##D 
##D # replace blanks in variable names
##D s1 <- stringr::str_locate(dat, "[A-z] [A-z]")
##D start <- s1[,"start"] + 1
##D for (ss in 1:length(start) ){
##D     if ( ! is.na( start[ss] ) ){
##D         substring( dat[ss], start[ss], start[ss] ) <- "_"
##D     }
##D }
##D 
##D # character matrix
##D miceadds::string_to_matrix(dat)
##D # numeric matrix containing correlations
##D miceadds::string_to_matrix(dat, rownames=2, col_elim=c(1,2), as_numeric=TRUE, diag_val=1,
##D            extend=TRUE )
##D #** reading means and SDs
##D miceadds::string_to_matrix(dat0[ c(15,16)], rownames=1, col_elim=c(1), as_numeric=TRUE )
##D 
##D #**** reading correlations (III)
##D dat <- data.ma08$mat3
##D dat <- gsub(" age ", "_age_", dat, fixed=TRUE )
##D miceadds::string_to_matrix(dat, rownames=2, col_elim=c(1,2), as_numeric=TRUE, diag_val=1,
##D        extend=TRUE )
##D 
##D #**** reading correlations (IV)
##D dat <- data.ma08$mat4 <- dat0
##D 
##D # remove spaces in variable names
##D dat <- gsub(" age ", "_age_", dat, fixed=TRUE )
##D s1 <- stringr::str_locate_all(dat, "[A-z,.] [A-z]")
##D NL <- length(dat)
##D for (ss in 1:NL ){
##D     NR <- nrow(s1[[ss]])
##D     if (NR>1){
##D         start <- s1[[ss]][2,1]+1
##D         if ( ! is.na( start ) ){
##D             substring( dat[ss], start, start ) <- "_"
##D         }
##D     }
##D }
##D 
##D miceadds::string_to_matrix(dat, rownames=2, col_elim=c(1,2), as_numeric=TRUE, diag_val=1,
##D      extend=TRUE )
## End(Not run)



