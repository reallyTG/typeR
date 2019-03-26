library(rHealthDataGov)


### Name: fetch_healthdata
### Title: Fetch HealthData.gov data sets
### Aliases: fetch_healthdata
### Keywords: API

### ** Examples

## Not run: 
##D df <- fetch_healthdata(resource="hosp", filter=list(addr_city="SAN FRANCISCO"))
##D head(df)
##D 
##D #       addr_city provider_id    tel_nbr seqn              addr_line_1
##D # 1 SAN FRANCISCO       50076 4158332646   38          2425 GEARY BLVD
##D # 2 SAN FRANCISCO       50228 4152068000  641      1001 POTRERO AVENUE
##D # 3 SAN FRANCISCO       50668 4157592300  660    375 LAGUNA HONDA BLVD
##D # 4 SAN FRANCISCO       50008 4156006000 1207         45 CASTRO STREET
##D # 5 SAN FRANCISCO       50152 4153536000 2353              900 HYDE ST
##D # 6 SAN FRANCISCO       50055 4156416562 2911 3555 CESAR CHAVEZ STREET
##D #                                ownership_type hsp_accreditation addr_postalcode
##D # 1 Government - Hospital District or Authority                             94115
##D # 2                          Government - Local                             94110
##D # 3                          Government - Local                             94116
##D # 4                Voluntary non-profit - Other                             94114
##D # 5              Voluntary non-profit - Private                             94109
##D # 6               Voluntary non-profit - Church                             94110
##D #   emergency_serv_type addr_state  _id hospital_type
##D # 1                 Yes         CA   38    Short-term
##D # 2                 Yes         CA  641    Short-term
##D # 3                 Yes         CA  660    Short-term
##D # 4                 Yes         CA 1207    Short-term
##D # 5                 Yes         CA 2353    Short-term
##D # 6                 Yes         CA 2911    Short-term
##D #                                             hsp_name county_cd
##D # 1         KAISER FOUNDATION HOSPITAL - SAN FRANCISCO       480
##D # 2                     SAN FRANCISCO GENERAL HOSPITAL       480
##D # 3      LAGUNA HONDA HOSPITAL & REHABILITATION CENTER       480
##D # 4  CALIFORNIA PACIFIC MEDICAL CTR-DAVIES CAMPUS HOSP       480
##D # 5                    SAINT FRANCIS MEMORIAL HOSPITAL       480
##D # 6  CALIFORNIA PACIFIC MEDICAL CTR - ST. LUKES CAMPUS       480
##D 
## End(Not run)



