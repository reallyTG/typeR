library(pm4py)


### Name: evaluation
### Title: Calculates evaluation measures for a Petri nets and an Event Log
### Aliases: evaluation evaluation_all evaluation_precision
###   variant_precision_etconformance evaluation_fitness
###   variant_fitness_token_based variant_fitness_alignment_based

### ** Examples

if (pm4py_available()) {
  library(eventdataR)
  data(patients)

  # As Inductive Miner of PM4PY is not life-cycle aware, keep only `complete` events:
  patients_completes <- patients[patients$registration_type == "complete", ]

  # Discover a Petri net
  net <- discovery_inductive(patients_completes)

  # Calculate evaluation measures for event log and Petri net
  evaluation_all(patients_completes,
                 net$petrinet,
                 net$initial_marking,
                 net$final_marking)

}



