library(dexterMST)


### Name: mst_rules
### Title: Define routing rules
### Aliases: mst_rules

### ** Examples

# a (complicated) three stage (1-3-3) routing design with 9 booklets and 7 modules

routing_rules = mst_rules(bk1 = M1[0:61] --+ M2[0:136]   --+ M5,
                          bk2 = M1[0:61] --+ M2[137:183] --+ M6,
                          bk3 = M1[0:61] --+ M2[184:Inf] --+ M7,

                          bk4 = M1[62:86] --+ M3[0:98]    --+ M5,
                          bk5 = M1[62:86] --+ M3[99:149]  --+ M6,
                          bk6 = M1[62:86] --+ M3[150:Inf] --+ M7,

                          bk7 = M1[87:Inf] --+ M4[0:98]    --+ M5,
                          bk8 = M1[87:Inf] --+ M4[99:130]  --+ M6,
                          bk9 = M1[87:Inf] --+ M4[131:Inf] --+ M7)
      



