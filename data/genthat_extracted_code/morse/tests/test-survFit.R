# data("cadmium2")
# 
# survDataset <- survData(cadmium2)
# 
# # survfitDatasetTKTD <- survFitTKTD(survDataset)
# # survfitDataset_SD <- survFit(survDataset, model_type = "SD")
# # survfitDataset_IT <- survFit(survDataset, model_type = "IT")
# 
# # ======================== summary
# 
# summary_survFitTKTD <- summary(survfitDatasetTKTD)
# summary_survFitSD <- summary(survfitDataset_SD)
# summary_survFitIT <- summary(survfitDataset_IT)
# 
# test_that("summary_survFit", {
#   
#   expect_is(summary_survFitSD, "list")
#   expect_is(summary_survFitIT, "list")
#   
# })
# 
# # ======================== print
# 
# print_survFitTKTD <- print(survfitDatasetTKTD)
# print_survFit_SD <- print(survfitDataset_SD)
# print_survFit_IT <- print(survfitDataset_IT)
# 
# 
# # ======================== ppc
# 
# ppc_survFitTKTD <- ppc(survfitDatasetTKTD)
# ppc_survFit_SD <- ppc(survfitDataset_SD)
# 
# ppc_survFitTKTD
# ppc_survFit_SD 
# 
# ppc_survFit_IT <- ppc(survfitDataset_IT)
# ppc_survFit_IT
# 
# 
# # ======================== plot 
# 
# plt_survFitTKTD <- plot(survfitDatasetTKTD, style = "ggplot", adddata = TRUE)
# plt_survFitTKTD 
# 
# plt_survFit_SD <- plot(survfitDataset_SD, adddata = TRUE)
# plt_survFit_SD
# 
# plt_survFit_IT <- plot(survfitDataset_IT, adddata = TRUE)
# plt_survFit_IT
