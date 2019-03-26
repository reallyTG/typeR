library(pm4py)


### Name: conformance
### Title: Conformance between an Event Log and a Petri net
### Aliases: conformance conformance_alignment
###   variant_state_equation_a_star

### ** Examples

if (pm4py_available()) {
  library(eventdataR)
  data(patients)

  # As Inductive Miner of PM4Py is not life-cycle aware, keep only `complete` events:
  patients_completes <- patients[patients$registration_type == "complete", ]

  # Discover a Petri net
  net <- discovery_inductive(patients_completes)

  # Align event log and Petri net
  a <- conformance_alignment(patients_completes,
                             net$petrinet,
                             net$initial_marking,
                             net$final_marking)

  # Alignment is returned as data frame
  head(a)
}




