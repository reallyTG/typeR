## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE, eval = FALSE)

## ------------------------------------------------------------------------
#  require(tidyverse)
#  # county level data of fertilizer application.
#  #Source: https://www.sciencebase.gov/catalog/item/5851b2d1e4b0f99207c4f238
#  raw_data = read_csv("../data-raw/CNTY_FERT_1987-2012.csv")
#  #summary(raw_data)
#  
#  # County summary from US census bureau.
#  # Source: https://www.census.gov/geo/maps-data/data/gazetteer2010.html
#  county_raw = read.table("../data-raw/Gaz_counties_national.txt", sep = "\t", header=TRUE)
#  
#  # read in data, extracted from coverage in ArcGIS.
#  n45_64 <- read.table("../data-raw/cty_fert0.n45-64.txt", sep = ",", header = T)
#  n65_85 <- read.table("../data-raw/cty_fert0.n65-85.txt", sep = ",", header = T)
#  p45_64 <- read.table("../data-raw/cty_fert0.p45-64.txt", sep = ",", header = T)
#  p65_85 <- read.table("../data-raw/cty_fert0.p65-85.txt", sep = ",", header = T)
#  # merge nitrogen and P data together.
#  n45_85 = inner_join(n45_64, n65_85, by = c("FIPS","STATE","Rowid_"))
#  p45_85 = inner_join(p45_64, p65_85, by = c("FIPS","STATE","Rowid_"))
#  

## ------------------------------------------------------------------------
#  # clean nitroge and phosphorus data.
#  nitrogen_1985 = n45_85 %>%
#    select(-Rowid_) %>%  # remove irrelavent info.
#    # add leading zeros for FIPS to make it 5 digits.
#    mutate(FIPS = str_pad(FIPS, 5, pad = "0")) %>%
#    gather(Year_temp, Quantity, Y45:Y85) %>%
#    mutate(Fertilizer = rep("N", length(.$Quantity)),
#           Farm.Type = rep("farm", length(.$Quantity)),
#           Year = paste("19",str_sub(Year_temp, start = 2),sep = "")
#           ) %>%
#    select(-Year_temp)
#  
#  phosphorus_1985 = p45_85 %>%
#    select(-Rowid_) %>%  # remove irrelavent info.
#    mutate(FIPS = str_pad(FIPS, 5, pad = "0")) %>%
#    gather(Year_temp, Quantity, Y45:Y85) %>%
#    mutate(Fertilizer = rep("P", length(.$Quantity)),
#           Farm.Type = rep("farm", length(.$Quantity)),
#           Year = paste("19",str_sub(Year_temp, start = 2),sep = "")
#           ) %>%
#    select(-Year_temp)
#  # clean dataset for data before 1985
#  clean_data_1985 = rbind(phosphorus_1985, nitrogen_1985)

## ------------------------------------------------------------------------
#  # remove duplicates in county data.
#  county_data = county_raw %>%
#    distinct(GEOID, .keep_all = TRUE) %>%
#    # select certin columns.
#    select(GEOID, ALAND, AWATER,INTPTLAT, INTPTLONG) %>%
#    mutate(FIPSno = GEOID) %>%
#    select(-GEOID)
#  
#  # combine county data with county level fertilizer data.
#  county_summary = left_join(raw_data,county_data, by = "FIPSno")
#  
#  clean_data = county_summary %>%
#    # remove some columns with FIPS numbers.
#    select(-c(FIPS_st, FIPS_co,FIPSno)) %>%
#    # wide to long dataset.
#    gather(Fert.Type, Quantity, farmN1987:nonfP2012) %>%
#    # separate the fert.type into three columns: farm type, fertilizer, year.
#    mutate(Year = str_sub(Fert.Type, start = -4),
#           Fertilizer = str_sub(Fert.Type, start = -5, end = -5),
#           Farm.Type = str_sub(Fert.Type, start = 1, end = 4)
#           ) %>%
#    # repalce nonf into nonfarm
#    mutate(Farm.Type = ifelse(Farm.Type == "nonf", "nonfarm", "farm")) %>%
#    # remove Fert.Type
#    select(-Fert.Type)
#  
#  # extract county summaries info from clean data.
#  cnty_summary_1985 = county_summary %>%
#    select(FIPS,State, County, ALAND, AWATER, INTPTLAT, INTPTLONG) %>%
#    right_join(clean_data_1985, by = "FIPS")
#  
#  # add data from 1945.
#  clean_data = rbind(clean_data, cnty_summary_1985) %>%
#    rename(Nutrient = Fertilizer) %>% # renam Fertilizer to nutrient.
#    mutate(Input.Type = rep("Fertilizer")) # add a colume as fertilizer, compared with Manure.

## ------------------------------------------------------------------------
#  # read in manure data from 1982 to 1997.
#  cnty_manure_97 = read_csv("../data-raw/cnty_manure_82-97.csv")
#  cnty_manure_summary = cnty_manure_97 %>%
#    select(-c(State, County)) %>%
#    gather(dummy, Quantity, N_1982:P_1997) %>%   # dummy is a temporay column.
#    mutate(Farm.Type = rep("farm", length(.$FIPS)),
#           Input.Type = rep("Manure", length(.$FIPS))) %>%
#    separate(dummy, c("Nutrient", "Year"), sep = "_")

## ------------------------------------------------------------------------
#  # read in manure data.
#  cnty_manure_02 = read_csv("../data-raw/cnty_manure_2002.csv")
#  cnty_manure_07 = read_csv("../data-raw/cnty_manure_2007.csv")
#  cnty_manure_12 = read_csv("../data-raw/cnty_manure_2012.csv")
#  
#  cnty_manure_02_12 = rbind(cnty_manure_02, cnty_manure_07, cnty_manure_12) %>%
#    select(-c(State, County)) %>%
#    gather(Nutrient, Quantity, N:P) %>%
#    mutate(Farm.Type = rep("farm", length(.$FIPS)),
#           Input.Type = rep("Manure", length(.$FIPS)))

## ----sava_data, eval=FALSE-----------------------------------------------
#  
#  # connect manure data.
#  cnty_manure_summary = rbind(cnty_manure_summary,cnty_manure_02_12)
#  
#  cnty_manure_all = county_summary %>%
#    select(FIPS,State, County, ALAND, AWATER, INTPTLAT, INTPTLONG) %>%
#    right_join(cnty_manure_summary, by = "FIPS")
#  
#  clean_data = rbind(clean_data, cnty_manure_all)
#  
#  # NOT RUN
#  # save cleaned data into .rda format.
#  save(clean_data, file = "../data/usfertilizer_county.rda")

