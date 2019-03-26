library(gemtc)


### Name: mtc.data.studyrow
### Title: Convert one-study-per-row datasets
### Aliases: mtc.data.studyrow

### ** Examples

## Example taken from the NICE DSU TSD series in Evidence Synthesis, #2
## Dopamine agonists for the treatment of Parkinson's

# Read the bugs-formatted data
data.src <- read.table(textConnection('
t[,1]	t[,2]	t[,3]	y[,1]	y[,2]	y[,3]	se[,1]	se[,2]	se[,3]	na[]
1	3	NA	-1.22	-1.53	NA	0.504	0.439	NA	2
1	2	NA	-0.7	-2.4	NA	0.282	0.258	NA	2
1	2	4	-0.3	-2.6	-1.2	0.505	0.510	0.478	3
3	4	NA	-0.24	-0.59	NA	0.265	0.354	NA	2
3	4	NA	-0.73	-0.18	NA	0.335	0.442	NA	2
4	5	NA	-2.2	-2.5	NA	0.197	0.190	NA	2
4	5	NA	-1.8	-2.1	NA	0.200	0.250	NA	2'), header=TRUE)

# Convert the data, setting treatment names
data <- mtc.data.studyrow(data.src,
  armVars=c('treatment'='t', 'mean'='y', 'std.err'='se'),
  treatmentNames=c('Placebo', 'DA1', 'DA2', 'DA3', 'DA4'))

# Check that the data are correct
print(data)

# Create a network
network <- mtc.network(data)



