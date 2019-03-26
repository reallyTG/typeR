library(safetyGraphics)


### Name: getSettingsMetadata
### Title: Get metadata about chart settings
### Aliases: getSettingsMetadata

### ** Examples

safetyGraphics:::getSettingsMetadata() 
# Returns a full copy of settingsMetadata.Rda

safetyGraphics:::getSettingsMetadata(text_keys=c("id_col")) 
# returns a dataframe with a single row with metadata for the id_col setting

safetyGraphics:::getSettingsMetadata(text_keys=c("id_col"), cols=c("label")) 
# returns the character value for the specified row. 




