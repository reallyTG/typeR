library(Rilostat)


### Name: get_ilostat
### Title: Read Ilostat Data
### Aliases: get_ilostat

### ** Examples

## Not run: 
##D ############# get simple dataset
##D 	dat <- get_ilostat("UNE_2UNE_SEX_AGE_NB_A")
##D  head(dat)
##D 	dat <- get_ilostat("NZL_Q", segment = "ref_area")
##D  head(dat)
##D 
##D 	dir.create(file.path(tempdir(), "r_cache"))
##D 	dat <- get_ilostat("UNE_2UNE_SEX_AGE_NB_A", 
##D                   cache_dir = file.path(tempdir(), "r_cache"))
##D  head(dat)
##D 
##D  clean_ilostat_cache(cache_dir = file.path(tempdir(), "r_cache")) 
##D 
##D  options(ilostat_update = TRUE)
##D 	dat <- get_ilostat("UNE_2UNE_SEX_AGE_NB_A")
##D 	head(dat)
##D 	options(ilostat_update = FALSE)
##D  options(ilostat_cache_dir = file.path(tempdir(), "r_cache"))
##D 	dat <- get_ilostat("UNE_2UNE_SEX_AGE_NB_A")
##D 
##D  clean_ilostat_cache() 
##D 
##D ############# get multiple datasets
##D 	dat <- get_ilostat(c("CPI_ACPI_COI_RT_M", 'CPI_ACPI_COI_RT_Q'), cache = FALSE)
##D  head(dat)
##D  toc <- get_ilostat_toc(search = 'CPI_')
##D  head(toc)
##D  dat <- get_ilostat(toc, cache = FALSE) #id as a tibble
##D 
##D ############# get datasets with filters
##D  dat <- get_ilostat(id = c("UNE_2UNE_SEX_AGE_NB_A", 'EMP_2EMP_SEX_AGE_NB_A'), 
##D 			filters = list(	ref_area = "FRA", 
##D 			classif1 = "AGE_YTHADULT_YGE15", 
##D 			time = "2016",
##D 			sex = c("T", 'SEX_F')), quiet = TRUE)
##D  head(dat)
##D  clean_ilostat_cache() 
##D 
##D ############# store in other format
##D  dir.create(file.path(tempdir(), "ilostat"))
##D 
##D  dat <- get_ilostat("UNE_2UNE_SEX_AGE_NB_A", 
##D                   cache_dir = file.path(tempdir(), "r_cache"), cache_format = 'csv')
##D  dat <- get_ilostat("UNE_2UNE_SEX_AGE_NB_A", 
##D                   cache_dir = file.path(tempdir(), "r_cache"), cache_format = 'dta')
##D 
##D ############# advanced manipulation
##D 
##D  dat <- get_ilostat("UNE_2UNE_SEX_AGE_NB_A", cmd = "dat %>% count(ref_area)", quiet = TRUE)
##D  label_ilostat(dat, code = 'ref_area')
##D 
##D  clean_ilostat_cache()
## End(Not run)



