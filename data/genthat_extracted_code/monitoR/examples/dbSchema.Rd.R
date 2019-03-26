library(monitoR)


### Name: dbSchema
### Title: Upload a MySQL Database Schema to Create Tables in an Acoustics
###   Database
### Aliases: dbSchema
### Keywords: database utilities

### ** Examples

## Not run: 
##D dbSchema(
##D     schema = "acoustics.sql", 
##D     name.on.host = "acoustics", 
##D     tables = TRUE, 
##D     schema.name = 'myschema', 
##D     db.name = "acoustics", 
##D     uid = "Admin", 
##D     pwd = "BadPassword!" )
##D      
##D ## $upload.time
##D ## [1] "Upload time 10.977 secs"
##D ##
##D ## $tables
##D ##    TABLE_CAT TABLE_SCHEM           TABLE_NAME TABLE_TYPE
##D ## 1     JKATZ3                   tblAnnotations      TABLE
##D ## 2     JKATZ3                       tblArchive      TABLE
##D ## 3     JKATZ3                          tblCard      TABLE
##D ## 4     JKATZ3                  tblCardRecorder      TABLE
##D ## 5     JKATZ3                     tblCovariate      TABLE
##D ## 6     JKATZ3             tblEnvironmentalData      TABLE
##D ## 7     JKATZ3                      tblLocation      TABLE
##D ## 8     JKATZ3                  tblOrganization      TABLE
##D ## 9     JKATZ3                        tblPerson      TABLE
##D ## 10    JKATZ3                 tblPersonContact      TABLE
##D ## 11    JKATZ3                       tblProject      TABLE
##D ## 12    JKATZ3                      tblRecorder      TABLE
##D ## 13    JKATZ3                        tblResult      TABLE
##D ## 14    JKATZ3                 tblResultSummary      TABLE
##D ## 15    JKATZ3                       tblSpecies      TABLE
##D ## 16    JKATZ3                 tblSpeciesPriors      TABLE
##D ## 17    JKATZ3                        tblSurvey      TABLE
##D ## 18    JKATZ3                      tblTemplate      TABLE
##D ## 19    JKATZ3                 tblTemplatePrior      TABLE
##D ##                                                          REMARKS
##D ## 1                          For annotated song events in surveys.
##D ## 2              For archiving sound clips extracted from surveys.
##D ## 3              This table stores information about memory cards.
##D ## 4                 Track survey, recorder, and memory card links.
##D ## 5  Describe covariates and types of enviromental data collected.
##D ## 6                   Non-acoustic data: environmental covariates.
##D ## 7   Information about about locations for surveys and templates.
##D ## 8             Store the organization name and contact info here.
##D ## 9                     Names of people in the monitoring program.
##D ## 10            Contact info, including Cell/Work Phone and email.
##D ## 11   Store the names of multiple projects per organization here.
##D ## 12          This table stores information about recording units.
##D ## 13                    Table to store the results of findPeaks().
##D ## 14                         Store probability of survey presence.
##D ## 15          Store BBL codes or other 4, 6, or 8 character codes.
##D ## 16                    Store site & species specific priors here.
##D ## 17         This table stores attributes of the survey recording.
##D ## 18                        Store templates and template metadata.
##D ## 19               Store beta parameter estimates for error rates.
##D 
##D 
## End(Not run)



