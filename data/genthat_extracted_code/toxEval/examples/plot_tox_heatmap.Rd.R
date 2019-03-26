library(toxEval)


### Name: plot_tox_heatmap
### Title: Plot EAR heat maps
### Aliases: plot_tox_heatmap

### ** Examples

path_to_tox <- system.file("extdata", package="toxEval")
file_name <- "OWC_data_fromSup.xlsx"
full_path <- file.path(path_to_tox, file_name)

tox_list <- create_toxEval(full_path)

ACC <- get_ACC(tox_list$chem_info$CAS)
ACC <- remove_flags(ACC)

cleaned_ep <- clean_endPoint_info(end_point_info)
filtered_ep <- filter_groups(cleaned_ep)

chemical_summary <- get_chemical_summary(tox_list, ACC, filtered_ep)
                                        
#Order the site_groupings:
tox_list$chem_site$site_grouping <- factor(tox_list$chem_site$site_grouping,
              levels=c("Lake Superior",
              "Lake Michigan",
              "Lake Huron",
              "Lake Erie",
              "Lake Ontario"))

#Order sites:
sitesOrdered <- c("StLouis","Nemadji","WhiteWI","Bad","Montreal",
"PresqueIsle","Ontonagon","Sturgeon","Tahquamenon","Burns",
"IndianaHC","StJoseph","PawPaw","Kalamazoo","GrandMI",
"Milwaukee","Muskegon","WhiteMI","PereMarquette","Manitowoc",
"Manistee","Fox","Oconto","Peshtigo","Menominee",
"Indian","Cheboygan","Ford","Escanaba","Manistique",
"ThunderBay","AuSable","Rifle","Saginaw","BlackMI",
"Clinton","Rouge","HuronMI","Raisin","Maumee",
"Portage","Sandusky","HuronOH","Vermilion","BlackOH",
"Rocky","Cuyahoga","GrandOH","Cattaraugus","Tonawanda",
"Genesee","Oswego","BlackNY","Oswegatchie","Grass",
"Raquette","StRegis")

tox_list$chem_site$`Short Name` <- factor(tox_list$chem_site$`Short Name`,
              levels = sitesOrdered)
              
plot_tox_heatmap(chemical_summary, 
                 tox_list$chem_site, 
                 category = "Biological",
                 manual_remove = "Undefined")
plot_tox_heatmap(chemical_summary, tox_list$chem_site, category = "Chemical Class")
plot_tox_heatmap(chemical_summary, tox_list$chem_site, category = "Chemical")




