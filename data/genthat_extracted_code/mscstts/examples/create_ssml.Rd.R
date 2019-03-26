library(mscstts)


### Name: create_ssml
### Title: Create SSML for Passing to Synthesize
### Aliases: create_ssml

### ** Examples

create_ssml("hey I really like things & dogs", escape = TRUE)
create_ssml("hey I really like things")
create_ssml('hey I <emphasis level="strong">really like</emphasis> things')
create_ssml('hey I <emphasis level="strong">really like</emphasis> things',
escape = TRUE)




