# ==============================================================================
# quickmatch -- Quick Generalized Full Matching
# https://github.com/fsavje/quickmatch
#
# Copyright (C) 2017 Fredrik Savje -- http://fredriksavje.com
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see http://www.gnu.org/licenses/
# ==============================================================================

library(quickmatch)
context("quickmatch")

raw_data <- matrix(c(
  -0.4872, 0.7451, -0.5165, 1.9151, -1.0990, 0.1415, -1.6650, -0.7701, 0.8870, -1.7677, 0.4690, -0.7884, -1.5393, -1.7362,
  -0.2024, 1.0733, -1.3620, -0.4470, 0.8180, -0.0763, 0.9161, 0.1498, -0.4148, -0.3479, 0.0125, 0.4151, -0.7968, -1.1322,
  0.3485, 1.4876, 0.0120, -0.6994, 1.3863, 0.8316, 1.5635, -0.8186, -1.1553, 0.9905, 0.4355, -0.3541, 0.1017, 1.6381, -1.0360,
  -0.3388, -0.3153, -0.8831, 1.5329, 0.8185, 0.6928, 0.3537, 1.3176, 1.0420, 0.9509, 0.0724, 1.1712, 1.4547, -1.2928, -0.7068,
  0.9908, 0.9348, 0.7290, -1.1964, -0.5767, 1.4289, 0.1575, 0.8106, 1.8869, -2.1967, 1.1377, -0.4083, -0.1881, 1.0856, 0.3577,
  1.5250, 0.2335, -1.0602, 0.1323, -0.1126, 0.3117, 0.7388, -0.2705, 0.6851, 0.1205, 0.9823, 0.9160, -1.3916, -0.0303, -2.6696,
  0.4105, -0.5251, 0.2119, 0.5794, 0.8496, 1.3887, 0.4537, 0.2799, -0.6344, 0.1534, 0.3601, 1.7681, 0.0953, 3.1733, -0.6397,
  0.6969, 1.2124, 0.0444, 0.2699, 0.5722, 1.4017, -2.0091, -0.2097, 1.1762, -0.8968, 0.4630, -1.0038, 0.9264, 0.0769, 0.6999,
  -0.7871, -0.1970, 1.6685, 2.2448, 1.8787, -0.0526, -0.3524, 0.1996, 0.4861, -2.3330, 1.7631, -0.2454, 1.9811, 1.7298, -1.3136,
  0.4381, -1.7302, -0.5488, -0.4629, 1.0734, 0.4401, 1.9076, 0.7295, 0.8086, -1.1172, -1.0829, 0.2377, 0.5529, 0.8747, -0.3075,
  0.3003, 0.0108, -0.9400, -2.3602, -0.6517, 0.3543, 1.1219, 1.2237, 1.2876, -0.4258, -0.5316, 1.5097, -0.9258, -0.2263, -1.6545,
  -0.5118, 0.8067, -0.4161, -1.3016, 0.6354, 0.5915, -1.3470, -0.8744, 0.1387, 0.6643, -0.2910, -0.3412, 0.1793, 0.7138, 0.2433,
  0.6125, -0.2464, 0.0057, 0.6646, 0.0736, 0.6896, -0.7782, -1.8728, 0.8456, 0.9308, -0.4463, -1.8400, -0.5621, 1.5114, -1.0632,
  0.1462, 1.9489, 0.3121, -0.6328, 0.0918, 0.2918, 0.4331, 1.2829, 0.3552, 0.4426, 0.2720, 2.3246, 0.7779, 0.9825, 1.7908, -0.6747,
  1.0587, 0.2962, 1.2923, -1.1576, 0.4971, -2.0785, 0.8715, 2.2522, -0.4881, 0.2309, -0.0164, -1.4632, 1.7606, -0.3353, -0.1725,
  -0.4967, 0.1605, 1.3567, 0.4294, 1.8146, -0.5629, 0.0107, 1.0025, -0.9478, -0.1239, -0.9951, 1.4195, 0.4877, -1.8599, 1.7040,
  0.0246, 1.1572, -0.4044, 0.2038, -0.6518, 0.5821, 0.3766, -0.7009, -1.0738, 0.9604, 0.1802, 0.5913, 0.0365, 0.4543, -1.0197,
  -0.7051, -0.6344, -1.0327, -0.9951, 0.6972, 0.8006, 0.8440, -1.3340, -0.4797, -0.2743, -1.0535, -0.0091, -0.4318, 0.3279,
  -0.1839, -0.5958, 1.5160, -0.0422, 0.3614, -0.8697, -1.1830, -1.1213, 1.5815, 1.6135, -0.3470, 0.0419, -0.4221, -0.6461,
  -1.0033, -0.0900, -0.5785, 1.7861, -0.1090, -1.0358, 0.1087, -0.0332, -0.3088, -0.4634, -0.0462, 0.6296, 1.7265, 0.4197, -0.7898,
  -1.7844, 1.9471, 0.7274, -0.8677, -0.2795, 0.2455, -0.9393, 1.1793, -0.3175, -0.8311, -0.6760, 0.2970, -0.9475, -0.2148, 0.5637,
  0.4079, 0.0066, 0.9437, -0.0163, -1.0125, 0.2154, -0.2482, -1.8247, -1.0617, 0.7498, 0.4034, 0.5635, -0.4876, 1.9992, 0.9648,
  -0.8537, 0.0063, -1.1641, -1.6558, 0.8655, 0.9480, -0.5356, 0.2981, 0.5342, -1.0418, 1.0282, -0.2379, 0.1199, 1.4087, 0.5974,
  1.0881, -0.6855, 2.0377, -0.5227, -1.0928, 0.6629, 1.2590, 1.7140, 0.3889, -1.1810, 0.5250, 1.0377, -2.8392, 0.2053, -0.2867,
  0.0450, -1.3993, 0.4165, 2.9334, -0.0015, 0.5121, 0.1672, -0.5330, -0.1301, -0.6468, 0.4862, 1.4244, 0.3494, -0.7650, -3.0832,
  -0.2569, -0.7141, -0.9665, -1.2767, 0.6289, -0.6010, -0.2776, -1.5355, -0.5862, -0.6076, -0.3462, -1.6480, -0.4506, -0.0737,
  2.1826, 0.3112, -1.4866, 0.3100, -0.1294, 0.0274, 1.0829, -0.0825, -1.6882, 0.8567, -0.2415, 0.1970, -1.1719, 0.8883, -0.3625,
  0.5567, 0.3272, -0.7696, -0.6935, 0.2545, -0.4362, -1.0174, 0.9380, 0.8912, 0.6014, -0.4535, 0.8919, 0.3829, -0.2889, -1.6220,
  -0.3766, -0.0062, 1.2260, -1.3599, -0.9028, 0.8031, 0.4731, 1.1029, -0.4523, -1.4486, -0.5979, 0.3783, 0.0164, 0.8578, -1.5953,
  -0.8259, -1.6055, 0.4267, -1.4018, 0.0276, 1.3672, 0.0181, 1.1177, -1.7308, 1.0657, -0.1088, 2.4203, -0.5355, -2.0901, -1.5322,
  -1.7706, 0.2952, 1.5633, 0.3468, -0.7159, 0.7950, 0.5505, -0.5370, -0.4594, 0.1716, -0.8158, 1.3633, -0.9603, 1.1322, -0.4228,
  -0.3554, 1.2230, 0.2992, 1.7149, -0.0627, 0.2368, -0.1479, -2.0702, -1.8919, 0.6002, -0.3636, -1.5506, 0.2206, -0.8984, 0.9310,
  1.5714, 1.0776, 0.7620, -1.2547, 2.2364, -0.5050, 1.1581, 0.9402, -0.2105, 0.5425, -1.7107, 0.9627, 0.2343, 1.0857, 0.4265, 0.9014,
  -2.2587, -0.4009, 0.1736, 0.5412, -0.6627, 1.0283, -0.3611, -0.0952, 1.1076, 0.1142, -0.8730, -0.4041, -0.1622, 0.6180, -1.4230,
  0.7598, -1.1315, -1.4547, 0.9569, -1.1144, -0.8974, -1.8576, 0.3025, -0.2148, 0.0795, 1.7697, 0.5964, 1.3837, -0.3508, -0.4489,
  -1.0038, 0.7689, -0.9172, -0.2032, 0.1305, 0.7555, -1.1910, 0.6642, 1.8022, -0.2778, 0.2482, -2.1934, 0.9776, -0.5258, 1.4201,
  0.9297, 0.7087, 1.1819, -0.8285, 0.5929, -1.6667, 1.4040, 0.6843, 0.1170, -2.5217, 0.5207, -0.5059, -1.8744, 0.8313, -0.0058,
  -1.4890, 1.7169, -0.9529, 0.1913, 1.5248, 0.9072, 0.6951, 0.9039, 1.1450, -0.7990, -0.8951, 0.0930, 1.8007, -0.8398, 0.1976,
  0.0284, 1.6596, -0.2373, 1.6222, 0.5146, 0.5970, -0.9764, -1.1838, 0.9578, -0.1807, 0.0804, 0.1399, 1.5009, 1.1879, 0.4374, -0.5793,
  0.5963, -1.2124, 1.2813, -0.7977, -0.2510, -0.4962, -0.5805, 0.5271, -0.1430, -0.4335, 0.3752, 0.4296, 0.9512, 2.5223, 0.0944,
  0.4732, 0.8319, 0.1064, -1.5534, 0.5204, -0.3217, 0.6548, 1.8891, 1.8319, -0.5004, -0.5851, -0.4657, 1.5465, -1.3594, 1.0047,
  -0.4412, -0.0397, 0.2357, 2.0599, 1.0330, -0.3042, 1.4978, 1.4697, 0.0848, 0.5442, -0.3818, 0.0743, 1.9379, 1.3631, 0.2789, 0.3412,
  -0.9296, 0.6453, -0.4919, 1.4866, -0.2201, 1.9315, 0.0905, -1.8105, 0.8638, -0.7237, -0.2104, -0.4444, 0.7172, -0.3825, 0.2067,
  -0.0333, -1.1909, 1.1056, 0.9053, -0.6597, -0.6914, 0.4585, -0.7110, 0.0690, 0.5465, 1.9854, 0.8117, 1.0793, 1.2360, -1.9689,
  -0.6541, -0.2067, -0.9436, -0.2843, 0.3925, -0.5058, 0.2156, -0.2359, 0.3010, 2.1301, 1.5143, 0.0042, 0.3615, -0.6853, 0.8183,
  -0.5962, -0.5115, -0.0717, -0.3841, -0.5058, -1.0159, 0.8669, 0.0163, -0.3912, 0.9714, 2.1844, 0.9561, 1.2363, -1.2320, 1.0044,
  -2.8297, -0.5989, 0.9072, -0.4030, -1.9363, -0.7543, 1.0802, 0.2087, 0.0241, 1.7565, -0.8564, 0.2633, 1.1214, 1.1939, -0.1404,
  -0.5400, -0.5482, -0.6363, 1.5533, -1.0036, 0.0684, -0.7229, -0.3722, 2.0825, 0.1669, 1.1343, 0.8718, -1.0742, 0.6947, 0.6584,
  -1.5386, -0.4617, -0.4007, -0.4141, -0.9637, 1.2189, 0.0330, 0.8760, -0.7897, -0.2739, 0.1020, -0.0052, -1.2279, 0.7426, -0.2921,
  -0.1473, 0.9460, 2.2570, -0.9717, 1.4505, 1.0058, 2.1400, 0.4182, -1.3513, -0.0570, -0.3588, 0.1365, 0.6475, -0.6026, 0.4890,
  -1.7305, 0.4392, -1.6688, -0.4057, 0.2632, -1.7420, -0.1697, 0.6454, 1.6009, 0.2703, -0.2497, -0.5316, 0.8671, 0.6408, 0.9662,
  1.7522, -0.4981, -0.6324, 0.7571, -0.4545, -1.5518, 0.7337, 0.4030, 0.1092, -0.2047, -0.7430, 1.1214, 0.7836, -0.3992, -0.3865,
  -0.9020, -0.9157, -0.0421, 0.3431, -0.8068, 0.1751, 0.5083, -0.5680, 0.1369, -0.4947, 2.2623, 1.2339, 0.3881, -0.2316, -1.6752,
  0.2572, 1.0593, -0.4890, -0.0756, -0.5038, -1.8795, -1.5513, -1.0853, 1.0083, 1.1964, -2.1472, 0.6647, 0.2958, 0.0789, 0.5603,
  2.5896, -0.5381, -0.7058, 0.1116, 0.1473, -0.5630, 0.6310, -0.0618, 0.4437, 0.7692, -2.1426, -2.2755, -0.1039, -0.1375, -0.2636,
  -0.0682, 0.4290, 1.5298, -0.4661, 0.2780, -0.3979, 0.9276, -0.4869, 1.5589, 0.7911, 0.0278, 0.1342, 0.6081, -1.2963, 0.6305,
  -0.5811, -1.3431, -0.3408, 2.7015, -0.0249, -1.5477, -0.7342, -0.5546, 0.4840, -0.1092, -0.3016, -0.4935, -0.8670, -1.3928, 0.3843,
  -0.1520, -0.6043, -1.5804, -0.2794, -0.0220, -0.3274, 0.3435, 0.4598, -0.0506, -0.0693, -0.5182, -0.7082, -0.2513, 0.5971, -0.0448,
  -1.1931, 0.2547, 0.5547, 0.7275, 0.0790, 0.7290, -1.7580, 1.4076, 0.0707, -1.3745, -0.9425, -1.7886, 1.0114, 0.6533, -2.4790,
  0.7734, -1.2740, 1.4678, 1.0326, 2.4520, -0.3818, 0.4637, 0.0647, 0.5835, -0.6451, 0.1827, 0.3267, 2.9147, 0.8831, 0.3677, 0.0840,
  1.8727, -1.9208, 0.5406, -0.9817, 0.4599, 0.6025, -0.0785, 0.2673, 0.3753, -2.0838, -0.7829, 1.3637, 1.2702, 0.6830, -0.2844,
  1.1863, -0.1296, -0.7212, 1.1061, 0.5191, -2.0950, -1.1772, 1.4060, -0.5879, -0.2722, 0.7108, -0.3690, 0.0525, 1.3578, -1.4684,
  0.0200, -1.5456, 0.7970, -0.4809, -0.7506, -0.5057, -1.5580, 1.0935, -1.0784, -1.0562, -0.1146, -0.9110, 0.8766, -0.7964, -2.4560,
  0.1778, 1.4359, 0.2717, -0.5767, 0.2234, 1.2251, 1.5370, -0.5174, 1.1125, 0.1106, 0.6372, 0.1512, 0.3230, 2.2387, -0.4424, -1.0800,
  1.3210, -1.2190, -0.6978, 0.2300, 0.3607, 1.8892, 0.5572, 0.9886, 1.3938, 0.3778, 0.9841, -0.4031, -0.9848, 0.2440, -1.3726, -0.9412,
  0.2147, -0.4574, 0.5361, 1.0282, 0.9216, 0.4758, 0.3440, 1.2460, -0.3306, -0.3788, 0.0800, 1.2618, 0.7217, -0.5614, 0.1019, 0.0530,
  -0.2299, 0.8542, -0.4069, 0.5273, 0.1136, -1.4586, 1.5515), ncol = 2)

distancesEucl <-  distances(raw_data)
distancesMaha <-  distances(raw_data, normalize = "mahalanobize")
treatmentsUse <- c("B", "A", "A", "A", "A", "A", "B", "A", "B", "A", "B", "B", "A", "B", "A", "A", "B", "A", "B", "A", "A", "A", "A", "B", "A",
                   "B", "A", "B", "A", "B", "B", "A", "A", "A", "A", "A", "B", "A", "A", "A", "A", "A", "B", "B", "A", "A", "A", "B", "A", "A", "B",
                   "B", "B", "B", "B", "A", "A", "A", "B", "A", "B", "B", "A", "A", "A", "B", "B", "B", "B", "A", "A", "B", "B", "B", "A", "A", "A",
                   "B", "B", "A", "B", "A", "A", "B", "B", "B", "B", "A", "A", "B", "B", "B", "B", "B", "A", "B", "B", "A", "A", "B", "B", "B", "B",
                   "B", "A", "A", "B", "B", "A", "A", "B", "B", "B", "A", "B", "A", "B", "A", "B", "B", "B", "B", "A", "B", "A", "B", "B", "B", "B",
                   "A", "B", "A", "B", "A", "A", "A", "A", "A", "A", "B", "A", "A", "A", "A", "B", "B", "A", "B", "A", "B", "B", "B", "A", "A", "B",
                   "A", "B", "A", "A", "B", "A", "A", "A", "A", "A", "B", "B", "A", "A", "B", "B", "A", "B", "B", "A", "B", "B", "B", "A", "A", "B",
                   "A", "A", "A", "B", "A", "A", "A", "A", "B", "A", "A", "B", "B", "B", "B", "B", "A", "A", "B", "B", "A", "A", "A", "A", "B", "B",
                   "A", "A", "A", "A", "B", "B", "B", "B", "A", "B", "A", "A", "B", "A", "A", "A", "A", "A", "A", "B", "B", "A", "A", "B", "A", "B",
                   "A", "A", "A", "A", "B", "A", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "A", "B", "A", "A", "B", "A", "B",
                   "B", "B", "B", "B", "B", "B", "A", "B", "B", "B", "B", "A", "B", "A", "A", "B", "B", "B", "A", "A", "A", "B", "A", "A", "A", "A",
                   "B", "B", "B", "B", "B", "B", "B", "B", "B", "B", "A", "A", "B", "A", "B", "A", "B", "B", "B", "A", "A", "A", "A", "B", "A", "B",
                   "B", "A", "A", "A", "A", "A", "A", "B", "B", "A", "A", "B", "A", "A", "B", "B", "A", "B", "B", "B", "A", "B", "A", "A", "A", "B",
                   "B", "A", "A", "B", "B", "B", "A", "A", "B", "B", "B", "A", "A", "A", "B", "A", "B", "A", "B", "B", "B", "B", "A", "B", "A", "B",
                   "B", "A", "A", "A", "B", "B", "B", "A", "A", "B", "A", "A", "A", "B", "B", "B", "B", "B", "A", "A", "A", "B", "B", "B", "B", "A",
                   "A", "B", "B", "A", "A", "A", "A", "A", "B", "A", "B", "A", "A", "B", "A", "A", "B", "A", "A", "B", "B", "B", "A", "A", "A", "B",
                   "A", "A", "A", "A", "B", "B", "B", "B", "A", "A", "A", "B", "B", "B", "B", "A", "A", "B", "A", "A", "A", "A", "B", "A", "B", "A",
                   "A", "B", "B", "A", "B", "A", "A", "A", "B", "B", "A", "A", "B", "B", "B", "B", "A", "A", "B", "A", "B", "B", "A", "A", "B", "B",
                   "B", "A", "B", "B", "B", "B", "A", "A", "A", "A", "A", "B", "B", "A", "B", "B", "A", "B", "A", "B", "A", "A", "A", "A", "B", "B",
                   "A", "B", "B", "A", "A", "B", "A")
Alogical <- (treatmentsUse == "A")
Aindex <- which(Alogical)

t_quickmatch <- function(distances = distancesEucl,
                         treatments = treatmentsUse,
                         treatment_constraints = c("A" = 1L, "B" = 1L),
                         size_constraint = 2L,
                         target = NULL,
                         caliper = NULL,
                         ...) {
  quickmatch(distances = distances,
             treatments = treatments,
             treatment_constraints = treatment_constraints,
             size_constraint = size_constraint,
             target = target,
             caliper = caliper,
             ...)
}

t_sc_clustering <- function(distances = distancesEucl,
                            size_constraint = 2L,
                            type_labels = treatmentsUse,
                            type_constraints = c("A" = 1L, "B" = 1L),
                            seed_method = "inwards_updating",
                            primary_data_points = NULL,
                            primary_unassigned_method = "closest_seed",
                            secondary_unassigned_method = "closest_seed",
                            seed_radius = NULL,
                            primary_radius = "seed_radius",
                            secondary_radius = "estimated_radius",
                            batch_size = 100L) {
  out_matching <- scclust::sc_clustering(distances = distances,
                                         size_constraint = size_constraint,
                                         type_labels = type_labels,
                                         type_constraints = type_constraints,
                                         seed_method = seed_method,
                                         primary_data_points = primary_data_points,
                                         primary_unassigned_method = primary_unassigned_method,
                                         secondary_unassigned_method = secondary_unassigned_method,
                                         seed_radius = seed_radius,
                                         primary_radius = primary_radius,
                                         secondary_radius = secondary_radius,
                                         batch_size = batch_size)
  class(out_matching) <- c("qm_matching", class(out_matching))
  out_matching
}


test_that("`quickmatch` returns correct output", {
  expect_identical(t_quickmatch(),
                   t_sc_clustering())
  expect_identical(t_quickmatch(distances = distancesEucl),
                   t_sc_clustering(distances = distancesEucl))
  expect_identical(t_quickmatch(distances = distancesMaha),
                   t_sc_clustering(distances = distancesMaha))
  expect_identical(t_quickmatch(distances = raw_data),
                   t_sc_clustering(distances = distancesEucl))
  expect_identical(t_quickmatch(distances = raw_data, normalize = "mahalanobize"),
                   t_sc_clustering(distances = distancesMaha))

  expect_identical(t_quickmatch(treatment_constraints = NULL),
                   t_sc_clustering())
  expect_identical(t_quickmatch(treatment_constraints = c("A" = 2L, "B" = 0L)),
                   t_sc_clustering(type_constraints = c("A" = 2L, "B" = 0L)))
  expect_identical(t_quickmatch(size_constraint = NULL),
                   t_sc_clustering())
  expect_identical(t_quickmatch(size_constraint = 4L),
                   t_sc_clustering(size_constraint = 4L))
  expect_identical(t_quickmatch(treatment_constraints = NULL, size_constraint = NULL),
                   t_sc_clustering())

  expect_identical(t_quickmatch(treatment_constraints = NULL, seed_method = "exclusion_updating"),
                   t_sc_clustering(seed_method = "exclusion_updating"))
  expect_identical(t_quickmatch(treatment_constraints = c("A" = 2L, "B" = 0L), seed_method = "exclusion_updating"),
                   t_sc_clustering(type_constraints = c("A" = 2L, "B" = 0L), seed_method = "exclusion_updating"))
  expect_identical(t_quickmatch(size_constraint = NULL, seed_method = "exclusion_updating"),
                   t_sc_clustering(seed_method = "exclusion_updating"))
  expect_identical(t_quickmatch(size_constraint = 4L, seed_method = "exclusion_updating"),
                   t_sc_clustering(size_constraint = 4L, seed_method = "exclusion_updating"))
  expect_identical(t_quickmatch(treatment_constraints = NULL, size_constraint = NULL, seed_method = "exclusion_updating"),
                   t_sc_clustering(seed_method = "exclusion_updating"))

  expect_identical(t_quickmatch(target = c("A", "B")),
                   t_sc_clustering())
  expect_identical(t_quickmatch(target = Aindex),
                   t_sc_clustering(primary_data_points = Aindex))
  expect_identical(t_quickmatch(target = Alogical),
                   t_sc_clustering(primary_data_points = Aindex))
  expect_identical(t_quickmatch(target = "A"),
                   t_sc_clustering(primary_data_points = Aindex))
  expect_identical(t_quickmatch(target = "A", caliper = 1.0),
                   t_sc_clustering(primary_data_points = Aindex, seed_radius = 0.5, secondary_radius = "seed_radius"))

  expect_identical(t_quickmatch(caliper = 1.0),
                   t_sc_clustering(seed_radius = 0.5))
  expect_identical(t_quickmatch(primary_unassigned_method = "ignore"),
                   t_sc_clustering(primary_unassigned_method = "ignore"))
  expect_identical(t_quickmatch(target = "A", secondary_unassigned_method = "ignore"),
                   t_sc_clustering(primary_data_points = Aindex, secondary_unassigned_method = "ignore"))
  expect_identical(t_quickmatch(primary_radius = 0.5),
                   t_sc_clustering(primary_radius = 0.5))
  expect_identical(t_quickmatch(target = "A", secondary_radius = 0.5),
                   t_sc_clustering(primary_data_points = Aindex, secondary_radius = 0.5))

  expect_warning(expect_identical(t_quickmatch(seed_radius = 0.5, caliper = 2.0),
                                  t_sc_clustering(seed_radius = 0.5)))
  expect_identical(t_quickmatch(caliper = 1.0, primary_unassigned_method = "ignore"),
                   t_sc_clustering(seed_radius = 0.5, primary_unassigned_method = "ignore", secondary_radius = "seed_radius"))
  expect_warning(expect_identical(t_quickmatch(caliper = 1.0, target = "A", secondary_unassigned_method = "closest_assigned"),
                                  t_sc_clustering(seed_radius = 0.5, primary_data_points = Aindex, secondary_unassigned_method = "closest_assigned", secondary_radius = "seed_radius")))
  expect_warning(expect_identical(t_quickmatch(caliper = 1.0, primary_unassigned_method = "closest_assigned"),
                                  t_sc_clustering(seed_radius = 0.25, primary_unassigned_method = "closest_assigned")))
  expect_warning(expect_identical(t_quickmatch(caliper = 1.0, primary_radius = "estimated_radius"),
                                  t_sc_clustering(seed_radius = 0.5, primary_radius = "estimated_radius", secondary_radius = "seed_radius")))
  expect_warning(expect_identical(t_quickmatch(caliper = 1.0, target = "A", secondary_radius = "estimated_radius"),
                                  t_sc_clustering(seed_radius = 0.5, primary_data_points = Aindex, secondary_radius = "estimated_radius")))
})


my_data <- data.frame(x1 = rbinom(1e3, 2, 0.4),
                      x2 = rbinom(1e3, 2, 0.4),
                      treatment = factor(sample(rep(c("T1", "T2", "C"), c(25e1, 25e1, 50e1)))))
my_distances <- distances(my_data, dist_variables = c("x1", "x2"))

test_that("`quickmatch` handles discrete covariates", {
  expect_warning(quickmatch(my_distances, my_data$treatment))
  expect_warning(expect_identical(quickmatch(my_distances, my_data$treatment),
                                               quickmatch(my_distances, my_data$treatment, secondary_unassigned_method = "ignore")))
  expect_error(quickmatch(my_distances, my_data$treatment, secondary_unassigned_method = "closest_seed"))
})
